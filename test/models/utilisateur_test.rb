require "test_helper"

class UtilisateurTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @utilisateur = Utilisateur.new(nom: "prenom1 Nom1", email: "prenom1@example.com", password: "pppppp", password_confirmation: "pppppp")
  end

  test"nom doit etre present" do
    @utilisateur.nom = ""
    assert_not @utilisateur.valid?
  end

  test"email doit etre present" do
    @utilisateur.email = ""
    assert_not @utilisateur.valid?
  end

  #length validation
  test"nom ne doit pas etre trop long" do
    @utilisateur.nom = "a" * 51
    assert_not @utilisateur.valid?
  end

  test"email ne doit pas etre trop long" do
    @utilisateur.email = "a" * 244 + "@exemple.com"
    assert_not @utilisateur.valid?
  end

  test "email validation doit accepeter les emails valides" do
    valid_addresses = %w[@example.com AAA@example.com]
    valid_addresses.each do |valid_address|
      @utilisateur.email = valid_address
      assert @utilisateur.valid?, "#{valid_address.inspect}"
    end
  end

  


end
