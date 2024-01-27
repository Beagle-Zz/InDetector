contract c12027{
    // query remaining time
    // this should not be used, query endTime once and then calculate it in your frontend
    // it's helpful when you want to debug in remix
    function timeLeft() public view returns (uint time) {
        if (now >= endTime) return 0;
        return endTime - now;
    }
}