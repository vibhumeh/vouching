//vouchee -blacklisted person who is being vouched for by a high level person.
pragma solidity 0.6.0;
//interface for ur code so i can run it rn and u can intergrate it more easily
interface feisc{
    function feiscore(address)external returns(uint);
    //gets the score of person
    function incrementsc(address) external;
    //increases persons score by 1
    
}
//vouch contract
contract vouchf{
    //friend is the link between the vouchee and the vouch giver so you know who to penalise incase of second defult
    mapping (address=>address) public friend;
    //banking is the main krredit bank contract address
    address banking;
    constructor(address banking)public {
        banking=banking;
    }
    //vouch function begins here, it only takes address of the vouch reciever.
    function vouch(address vouchee) public returns (bool success){
        //checks if his level is high enough (6 is dummy num)
        require(feisc(banking).feiscore(msg.sender)>=6,"your level is too low");
        //makes sure the receaver lev is at 0 so this feature cannot increase level of non-zero ppl
        require(feisc(banking).feiscore(vouchee)==0,"vouchee level is not 0");
        //tags person who vouched for vouchee
        friend[vouchee]=msg.sender;
        //increases level and makes vouchee eligible for loans again
        feisc(banking).incrementsc(vouchee);
    }
}
