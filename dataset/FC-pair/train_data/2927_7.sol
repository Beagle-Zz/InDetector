contract c2927{
    //check whether the burner is eligible burner
    modifier isBurner(address _burner){
        require(allowedBurners[_burner]);
        _;
    }
}