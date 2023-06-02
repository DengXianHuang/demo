import request from '@/utils/request'

// 查询岗位列表
export function listFilter(query) {
  return request({
    url: '/system/filter/list',
    method: 'get',
    params: query
  })
}

// 查询岗位详细
export function getFilter(filterUrlConfigId) {
  return request({
    url: '/system/filter/getById/' + filterUrlConfigId,
    method: 'get'
  })
}

// 新增岗位
export function addFilter(data) {
  return request({
    url: '/system/filter/insert',
    method: 'post',
    data: data
  })
}

// 修改岗位
export function updateFilter(data) {
  return request({
    url: '/system/filter/update',
    method: 'put',
    data: data
  })
}

// 删除岗位
export function delFilter(ids) {
  return request({
    url: '/system/filter/delete/' + ids,
    method: 'delete'
  })
}
