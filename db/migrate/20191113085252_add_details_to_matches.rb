class AddDetailsToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :status, :string
    add_column :matches, :fs_match_id, :integer
    add_column :matches, :competition_id, :integer
    add_column :matches, :game_week, :integer
    add_column :matches, :winningTeam, :integer
    add_column :matches, :team_a_corners, :integer
    add_column :matches, :team_b_corners, :integer
    add_column :matches, :team_a_offsides, :integer
    add_column :matches, :team_b_offsides, :integer
    add_column :matches, :team_a_yellow_cards, :integer
    add_column :matches, :team_b_yellow_cards, :integer
    add_column :matches, :team_a_red_cards, :integer
    add_column :matches, :team_b_red_cards, :integer
    add_column :matches, :team_a_shotsOnTarget, :integer
    add_column :matches, :team_b_shotsOnTarget, :integer
    add_column :matches, :team_a_shots, :integer
    add_column :matches, :team_b_shots, :integer
    add_column :matches, :team_a_fouls, :integer
    add_column :matches, :team_b_fouls, :integer
    add_column :matches, :team_a_possession, :integer
    add_column :matches, :team_b_possession, :integer
  end
end
