contract c10036{
     /**
     * function to withdraw SoftwareProductDevelopment funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawSoftwareProductDevelopment() public onlyOwner {
        require (SoftwareProductDevelopmentAccumulated > 0);
        owner.transfer(SoftwareProductDevelopmentAccumulated);
        SoftwareProductDevelopmentAccumulated = 0;
    }
}