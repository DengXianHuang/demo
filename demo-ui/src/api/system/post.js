import request from '@/utils/request'

// 查询岗位列表
export function listPost(query) {
  return request({
    url: '/system/post/forPage',
    method: 'get',
    params: query
  })
}

// 查询岗位详细
export function getPost(sysPostId) {
  return request({
    url: '/system/post/getById/' + sysPostId,
    method: 'get'
  })
}

// 新增岗位
export function addPost(data) {
  return request({
    url: '/system/post/insert',
    method: 'post',
    data: data
  })
}

// 修改岗位
export function updatePost(data) {
  return request({
    url: '/system/post/updateById',
    method: 'put',
    data: data
  })
}

// 删除岗位
export function delPost(sysPostIds) {
  return request({
    url: '/system/post/delete/' + sysPostIds,
    method: 'delete'
  })
}
