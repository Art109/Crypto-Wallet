namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
       show_spinner("Apagando BD") { puts %x(rails db:drop:_unsafe)}
       show_spinner("Criando BD ") { puts %x(rails db:create)}
       show_spinner("Migrando BD ") { puts %x(rails  db:migrate )}
       %x(rails dev:add_mining_types)
       %x(rails dev:add_coins)
    else 
        puts "Você não está em ambiente de desenvolvimento"
    end
  end
  
  desc "Cadastra Moedas"
  task add_coins: :environment do
        show_spinner("Cadastrando Moedas ") do
        coins = [
                    {
                        description: "Bitcoin",
                        acronym: "BTC",
                        url_image: "https://logodownload.org/wp-content/uploads/2017/06/bitcoin-logo-1-1.png",
                        mining_type: MiningType.find_by(acronym: 'PoW')
                    },
                
                    {
                        description: "Ethereum",
                        acronym: "ETH",
                        url_image: "https://download.logo.wine/logo/Ethereum/Ethereum-Logo.wine.png",
                        mining_type: MiningType.find_by(acronym: 'PoS')
                    },
                
                    {
                        description: "Rupee",
                        acronym: "RUP",
                        url_image: "https://cdn.wikimg.net/en/zeldawiki/images/8/85/TotK_Green_Rupee_Icon.png",
                        mining_type: MiningType.find_by(acronym: 'PoF')
                    },
                    
                    {
                        description: "MH Zenny",
                        acronym: "MHZ",
                        url_image: "https://kboosting.com/img/17673/c/zenny-500x500.png",
                        mining_type: MiningType.find_by(acronym: 'PoF')
                    }
            ]
        
        
        coins.each do |coin| 
            Coin.find_or_create_by!(coin)
        end
    end
    end
    
  desc "Cadastro Tipos de Mineração"
  task add_mining_types: :environment do
      show_spinner("Cadastrando Tipos de Mineração  ") do
      mining_types = [
            {description: "Proof of Work" , acronym: "PoW"},
            {description: "Proof of Stake" , acronym: "PoS"},
            {description: "Proof of Capacity" , acronym: "PoC"},
            {description: "Proof of Farm" , acronym: "PoF"}
          ]
          
      mining_types.each do |mining_type|
          MiningType.find_or_create_by!(mining_type)
      end
     end
  end

  
  private

    def show_spinner(msgStart)
        spinner = TTY::Spinner.new("[:spinner] #{msgStart}")
        spinner.auto_spin # Automatic animation with default interv
        yield
        spinner.success("Feito!") # Stop animation
    end
end
