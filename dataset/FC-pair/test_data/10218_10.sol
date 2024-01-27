contract c10218{
    //draw card
    function drawPlayer(address _address) public payable returns (uint playerId){
        require(msg.value == drawFee && playerInDraw > 0);
        for(uint i =0;i < players.length;i++){ 
            if(players[i].isDraw == 0){ 
                players[i].isDraw = 1;
                playerInDraw  = playerInDraw.sub(1);
                playerToOwner[i] = msg.sender;
                ownerPlayerCount[msg.sender] = ownerPlayerCount[msg.sender].add(1);
                if(_address != 0){ 
                 uint inviteFee = msg.value * 5 / 100;
                 _address.transfer(inviteFee);
                 emit inviteBack(msg.sender,_address,inviteFee);
                }
                emit drawedPlayer(i,msg.sender,now);
                return i;
            }
        }
    }
}