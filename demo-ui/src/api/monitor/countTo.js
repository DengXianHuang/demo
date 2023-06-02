import request from '@/utils/request'

export function countOnline(query) {
  return request({
    url: '/online/number',
    method: 'get',
    params: query
  })
}
