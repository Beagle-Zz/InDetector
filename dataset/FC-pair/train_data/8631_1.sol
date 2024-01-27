contract c8631{
  /**
   * @dev Returns the rate of tokens per wei at the present time.
   */
  function getRate() public view returns (uint256) {
    if (now <= openingTime.add(14 days)) return 1000;   // 1st-14th July: 1 ETH = 1000 QUIN
    if (now > openingTime.add(14 days) && now <= openingTime.add(15 days)) return 667;   // 14th-15th July: 1 ETH = 667 QUIN
    if (now > openingTime.add(15 days) && now <= openingTime.add(16 days)) return 500;   // 15th-16th July: 1 ETH = 500 QUIN
    if (now > openingTime.add(16 days) && now <= openingTime.add(17 days)) return 400;   // 16th-17th July: 1 ETH = 400 QUIN
    if (now > openingTime.add(17 days)) return 333;   // 17th-18th July: 1 ETH = 333 QUIN
  }
}