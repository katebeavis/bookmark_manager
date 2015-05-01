require 'spec_helper'

describe Link do
  subject { described_class }
  context 'Demonstration of how datamapper works' do
    it 'is created and then retrieved from the db' do
      expect(subject.count).to eq 0
      subject.create(title: 'Makers Academy',
                     url: 'http://www.makersacademy.com/')
      expect(subject.count).to eq 1
      link = subject.first
      expect(link.url).to eq('http://www.makersacademy.com/')
      expect(link.title).to eq('Makers Academy')
      link.destroy
      expect(subject.count).to eq 0
    end
  end
end
