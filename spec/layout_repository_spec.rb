require 'spec_helper'

module LayoutConfigurator
  describe LayoutRepository do
    before do
      LayoutRepository.initialize
    end

    it 'allows storing data' do
      LayoutRepository.store('foo', 'some data')

      expect(LayoutRepository.all).to eq({ 'foo' => 'some data' })
    end

    it 'allows getting data' do
      LayoutRepository.store('foo', 'some data')

      expect(LayoutRepository.search('foo')).to eq('some data')
    end

    it 'allows removing data' do
      LayoutRepository.store('foo', 'some data')
      LayoutRepository.remove('foo')

      expect(LayoutRepository.all).to eq({})
    end
  end
end
