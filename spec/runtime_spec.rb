# frozen_string_literal: true

RSpec.describe 'Runtime' do
  it 'gets constant' do
    expect(Runtime['Object']).not_to be_nil
  end

  it 'creates an Object constant' do
    expect(Runtime['Object']).to eq Runtime['Object'].new.runtime_class
  end

  it 'creates an Object mapped to ruby value' do
    expect(Runtime['Number'].new_with_value(42).ruby_value).to eq 42
  end

  it 'lookups method in class' do
    expect(Runtime['Object'].lookup('print')).not_to be_nil
    expect { Runtime['Object'].lookup('non-existant') }.to raise_error(RuntimeError)
  end

  it 'calls method' do
    object = Runtime['Object'].call('new')
    expect(Runtime['Object']).to eq object.runtime_class
  end

  it 'a class is a class' do
    expect(Runtime['Number'].runtime_class).to eq Runtime['Class']
  end
end
