require 'rails_helper'
require 'spec_helper'

describe 'ルーティング' do
  example '存在しないページならerrors/not_foundへ' do
    expect(get: 'http://0.0.0.0:3000/xyz').to route_to(
                                                  controller: 'errors',
                                                  action:'routing_error',
                                                  antything:'xyz'
                                              )
  end
end


