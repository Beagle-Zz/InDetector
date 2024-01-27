contract c10971{
    /**
    * Reverts if not in crowdsale time range. 
    */
    modifier onlyWhileOpen {
       require(now >= openingTime && now <= closingTime, "Sale open");
        _;
    }
}