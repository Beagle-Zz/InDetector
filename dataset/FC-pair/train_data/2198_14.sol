contract c2198{
    /**
     * send award to last winner of the list
     **/
    function sendAwardToLastWinner() public isEnded {
        address(winnerList[winnerList.length - 1]).transfer(award);
        delete winnerList[winnerList.length - 1];
        winnerList.length--;
        if(winnerList.length == 0){
          address add=address(officialAddress);
          address(add).transfer(address(this).balance);
        }
    }
}