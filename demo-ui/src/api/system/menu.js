import request from '@/utils/request'

// 查询菜单列表
export function listMenu(query) {
  return request({
    url: '/system/menu/list',
    method: 'get',
    params: query
  })
}

// 查询菜单详细
export function getMenu(sysMenuId) {
  return request({
    url: '/system/menu/' + sysMenuId,
    method: 'get'
  })
}

// 查询菜单下拉树结构
export function treeselect() {
  return request({
    url: '/system/menu/treeSelect',
    method: 'get'
  })
}

// 根据角色ID查询菜单下拉树结构
export function roleMenuTreeselect(query) {
  return request({
    url: '/system/menu/selectMenuTreeByRoleId',
    method: 'get',
    params: query
  })
}

// 新增菜单
export function addMenu(data) {
  return request({
    url: '/system/menu/insert',
    method: 'post',
    data: data
  })
}

// 修改菜单
export function updateMenu(data) {
  return request({
    url: '/system/menu/update',
    method: 'put',
    data: data
  })
}

// 删除菜单
export function delMenu(sysMenuId) {
  return request({
    url: '/system/menu/delete/' + sysMenuId,
    method: 'delete'
  })
}
