contract c12027{
    // calculates the bid after the current bid so nifty hackers can skip the queue
    // this is not in our frontend and no one knows if it actually works
    function nextNextBid() public view returns (uint _nextBid) {
        return highestBindingBid.add(potato).add((highestBindingBid.add(potato)).mul(4).div(9));
    }
}