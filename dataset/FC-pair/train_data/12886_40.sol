contract c12886{
    // Set _periods Spending amount percentage with time schedule using Period
    function setPeriod(uint[] _periods) public
    onlyOwner()
    {
        // Check period array length
        require(_periods.length == 4);
        // Set Period
        for(uint i=0; i<_periods.length/2; i++) {
            periods[i].time = _periods[i*2];
            periods[i].percentage = _periods[i*2+1];
        }
        // Verify if lower bound is greater than upper bound
        require(periods[0].time <= periods[1].time);
    }
}