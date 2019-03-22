package com.chinasofti.commonmapper;

import tk.mybatis.mapper.common.BaseMapper;
import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * 为了可拓展性以及灵活性，加入该中间层，为以后添加更多自定义的通用方法提供便利
 * @param <T>
 */
public interface CommonMapper<T> extends BaseMapper<T>, MySqlMapper<T>, IdsMapper<T> {
}
