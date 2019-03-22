package com.chinasofti.service;

import com.chinasofti.constant.EnumAuditRuleType;
import com.chinasofti.entity.Auditrule;
import com.chinasofti.entity.Course;
import com.chinasofti.entity.Creditrequest;
import com.chinasofti.entity.Family;
import com.chinasofti.entity.School;
import com.chinasofti.entity.Student;
import com.chinasofti.mapping.AuditruleDao;
import com.chinasofti.mapping.CreditrequestDao;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

@Component
public class AuditService {

    @Autowired
    private AuditruleDao auditruleDao;

    @Autowired
    private CreditrequestDao creditrequestDao;

    public void autoAudit(EnumAuditRuleType ruleType, Creditrequest creditrequest, Student student, List<Family> families, School school, List<Course> courses) {
        Auditrule param = new Auditrule();
        param.setRuleType(ruleType.name());
        List<Auditrule> rules = auditruleDao.select(param);

        Creditrequest r = new Creditrequest();
        r.setSId(creditrequest.getSId());
        List<Creditrequest> select = creditrequestDao.select(r);
        Collections.sort(select, new Comparator<Creditrequest>() {
            @Override
            public int compare(Creditrequest o1, Creditrequest o2) {
                return o2.getRId().compareTo(o1.getRId());
            }
        });

        int schoolAutoAuditPass = 6;
        int schoolAutoAuditFail = 7;
        int bankAutoAuditPass = 8;
        int bankAutoAuditFail = 9;

        Creditrequest updateParam = new Creditrequest();
        for (Auditrule rule : rules) {
            final boolean[] auditResult = {false};
            Object auditTarget;
            String targetObjName = rule.getTargetObj();
            if (StringUtils.equals(targetObjName, "creditrequest")) {
                auditTarget = creditrequest;
            } else if (StringUtils.equals(targetObjName, "student")) {
                auditTarget = student;
            } else if (StringUtils.equals(targetObjName, "families")) {
                auditTarget = families;
            } else if (StringUtils.equals(targetObjName, "school")) {
                auditTarget = school;
            } else {
                auditTarget = courses;
            }


            ReflectionUtils.doWithFields(auditTarget.getClass(), new ReflectionUtils.FieldCallback() {
                @Override
                public void doWith(Field field) throws IllegalArgumentException, IllegalAccessException {
                    field.setAccessible(true);
                    String name = field.getName();
                    if(StringUtils.equals(name, rule.getPropName())) {
                        String exceptValue = rule.getExceptValue();

                        String propType = rule.getPropType();
                        Object expectValueObj;
                        if(StringUtils.equals(propType, "int")) {
                            expectValueObj = Integer.parseInt(exceptValue);
                        } else {
                            expectValueObj = exceptValue;
                        }

                        String operType = rule.getOperType();
                        String operator = rule.getOperator();

                        Object value = field.get(auditTarget);
                        if(StringUtils.equals(operType, "compare")) {
                            if(StringUtils.equals(operator, "=")) {
                                if(!Objects.equals(value, expectValueObj)) {
                                    auditResult[0] = false;
                                }
                            } else if(StringUtils.equals(operator, ">")) {
                                int result = ObjectUtils.compare((Comparable)value, (Comparable)expectValueObj);
                                auditResult[0] = result > 0;
                            } else if(StringUtils.equals(operator, "<")) {
                                int result = ObjectUtils.compare((Comparable)value, (Comparable)expectValueObj);
                                auditResult[0] = result < 0;
                            }
                        }
                    }
                }
            });



            boolean pass = auditResult[0];

            updateParam.setRId(select.get(0).getRId());

            if(ruleType == EnumAuditRuleType.school) {
                if(pass) {
                    creditrequest.setFlag(schoolAutoAuditPass);
                    creditrequest.setSchoolidea("学校自动审核通过");
                    updateParam.setSchoolidea(creditrequest.getSchoolidea());
                    updateParam.setFlag(creditrequest.getFlag());
                } else {
                    creditrequest.setFlag(schoolAutoAuditFail);
                    creditrequest.setSchoolidea("学校自动审核拒绝");
                    updateParam.setSchoolidea(creditrequest.getSchoolidea());
                    updateParam.setFlag(creditrequest.getFlag());
                    break;
                }

            } else {
                if(pass) {
                    creditrequest.setFlag(bankAutoAuditPass);
                    creditrequest.setBankidea("银行自动审核通过");
                    updateParam.setBankidea(creditrequest.getBankidea());
                    updateParam.setFlag(creditrequest.getFlag());
                } else {
                    creditrequest.setFlag(bankAutoAuditFail);
                    creditrequest.setBankidea("银行自动审核失败");
                    updateParam.setBankidea(creditrequest.getBankidea());
                    updateParam.setFlag(creditrequest.getFlag());
                    break;
                }

            }
        }

        creditrequestDao.updateByPrimaryKeySelective(updateParam);

        if(updateParam.getFlag() == schoolAutoAuditPass) {
            autoAudit(EnumAuditRuleType.bank, creditrequest, student, families, school, courses);
        }
    }
}
