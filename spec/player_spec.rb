require 'player'

describe Player do
    it "creates a player with a value" do
        player = Player.new('Angie')
        expect(player.token).to eq("Angie")
    end
end