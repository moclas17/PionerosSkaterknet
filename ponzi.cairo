
use starknet::get_caller_address;
use starknet::get_contract_address;
use starknet::contract_address_const;
use starknet::ContractAddress;
use starknet::ContractAddressZeroable;

#[abi]
trait PonziTrait {
    fn buy(address: ContractAddress) ;
    fn compoundRekt(address: ContractAddress);    
    fn rektRewards(address: ContractAddress);
    fn sellRekt();
    fn calculateTrade(rt: u32, rs: u32, bs: u32)-> u32 ;
    fn calculateRektsSell( eggs: u32)-> u32 ;
    fn calculateRektBuy(eth: u32, contractBalance: u32)-> u32;    
    fn calculateRektBuySimple(eth: u32)-> u32;
    fn feeSell(amount: u32)-> u32;
    fn getBalance()-> u32;
    fn getMyMiners(address: ContractAddress)-> u32;
    fn getMyRekts(address: ContractAddress) -> u32;
    fn getRektsSinceLastHatch(address: ContractAddress) -> u32;
    fn minimum(a: u32, b:u32)-> u32 ;
}

#[contract]

mod PonziModule{
    const  REKTS_TO_HATCH_1MINER:u32 = 1080000_u32;
    const  PSN:u32 = 10000_u32;
    const PSNH:u32 = 5000_u32;
    const feeValSell:u32 = 8_u32;
    const initialized:bool = false;
    //variables de estado
    struct Storage{
        marketRekts: u32,
        recAdd: u32,
        rektsMiners: LegacyMap::<ContractAddress, u256>, 
        claimedRekts: LegacyMap::<ContractAddress, u256>, 
        lastHatch: LegacyMap::<ContractAddress, u256>,       
    }

     #[constructor]
    fn constructor( _recAdd: u32) {
        recAdd::write(_recAdd);
    }
    
    fn buy(address: ContractAddress) {
        
    }

    fn compoundRekt(address: ContractAddress){

    } 
    
    fn rektRewards(address: ContractAddress){

    } 
    fn sellRekt(){

    }

    fn calculateTrade(rt: u32, rs: u32, bs: u32)-> u32 {
        ( PSN * bs) / ( PSNH + ( ( (PSN * rs) + (PSNH * rt) ) / rt ) )
    } 

    fn calculateRektsSell( eggs: u32)-> u32 {
         calculateTrade(eggs, marketRekts, address(this).balance);
        

    } 

    fn calculateRektBuy(eth: u32, contractBalance: u32)-> u32{

    }
    
    fn calculateRektBuySimple(eth: u32)-> u32{

    }

    fn feeSell(amount: u32)-> u32{

    }

    fn getBalance()-> u32{

    }
    fn getMyMiners(address: ContractAddress)-> u32{
         _stakers::read(address)
    }

    fn getMyRekts(address: ContractAddress) -> u32{

    }

    fn getRektsSinceLastHatch(address: ContractAddress) -> u32{

    }

    fn minimum(a: u32, b:u32)-> u32 {
        if a < b {
            a
        }
        else{
            b
        }
    }      
    
}