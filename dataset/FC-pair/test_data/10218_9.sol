contract c10218{
    //create player;
    function createPlayer(uint16 _attack) public onlyOwner{ 
      uint id = players.push (Player(0 ether,0,_attack,0,0,0,0)) - 1;
      playerInDraw = playerInDraw.add(1);
      emit newPlayer(id,_attack);
    }
}