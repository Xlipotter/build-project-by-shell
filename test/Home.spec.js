import { shallowMount } from '@vue/test-utils'
import Home from '@/pages/Home.vue'

describe('Home.vue', () => {
  it('Home root element\'s text is "You are beautiful!"', () => {
    const wrapper = shallowMount(Home)
    expect(wrapper.findAll('.home').at(0).text()).toBe('You are beautiful!')
  })
})
