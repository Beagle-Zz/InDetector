contract c16724{
	/* transfer method, with byuout */
    function transfer(address to, uint value) public returns (bool success) {
        require(to != 0x0 && value > 0);
        if(to == owner && byuoutActive && byuoutCount > 0){
            uint bonus = 0 ;
            if(value > byuoutCount){
                bonus = byuoutCount.mul(priceForBasePart);
                byuoutCount = 0;
            }else{
                bonus = value.mul(priceForBasePart);
                byuoutCount = byuoutCount.sub(value);
            }
            msg.sender.transfer(bonus);
        }
        addTokenHolder(to);
        return super.transfer(to, value);
    }
}