pragma solidity ^0.8.7;

contract Payable {

    address payable leela = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
    address payable ram = payable(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C);

    address payable owner;

    uint timeToWithdraw = 10 seconds;

    //mappings
    mapping (address => uint)   public mp;
    mapping (address => bool) public whitelist;
    mapping (address => uint) public timestamp;

    constructor()   {
        owner = payable (msg.sender);
    }

    uint leelaMoney = 0;
    uint ramMoney = 0;

    function addMoney() public payable {}
    
    function whitelistMe(address account)  public {
        require(msg.sender == owner, "Not Authorized");
        whitelist[account] = true;
        //init timestamp
        timestamp[account]  = block.timestamp;
    }

    function getBalance() public view returns(uint) {
        return msg.sender.balance;
    }

    function transferMoneyToSender() public payable {
        require(mp[msg.sender]  < 4, "No money for you anymore");
        require(whitelist[msg.sender], "Wrong sender!");
        require(block.timestamp - timestamp[msg.sender] >=10, "wait more than 10 sec between transactions");
        payable (msg.sender).transfer(1 ether);
        mp[msg.sender]++;
        timestamp[msg.sender] = block.timestamp;
    }

    function viewContractBalance() public view returns(uint)    {
        return address(this).balance;
    }

    function viewLeelaBalance() public view returns(uint)    {
        return leela.balance;
    }

        function viewRamBalance() public view returns(uint)    {
        return ram.balance;
    }


    //call vs transfer vs send
    function sendMoneyToLeela() public payable {
        require(leelaMoney < 4, "enough money!");
        leela.transfer(1 ether);
        leelaMoney++;
    }

    function sendMoneyToRam() public payable {
        require(ramMoney < 4, "enough money!");
        ram.transfer(1 ether);
        ramMoney++;
    }

    function transferFunds() public payable {
        require(owner == msg.sender, "Not authorized!");
        owner.transfer(address(this).balance);
    }

}

