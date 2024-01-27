contract c12886{
    // Get specified period by index
    function getPeriod(uint n) public view returns (uint, uint) {
        return (periods[n].time, periods[n].percentage);
    }
}