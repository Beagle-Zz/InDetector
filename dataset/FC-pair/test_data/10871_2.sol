contract c10871{
  // ------------------------------------------------------------------------------------------ //
  // FUNCTIONS TRIGGERING TRANSACTIONS
  // ------------------------------------------------------------------------------------------ //
  /**
   * @dev Add a new insurance for the given flight
   * @param flightId <carrier_code><flight_number>.<timestamp_in_sec_of_departure_date>
   * @param limitArrivalTime Maximum time after which we trigger the compensation (timestamp in sec)
   * @param premium Amount of premium paid by the client
   * @param indemnity Amount (potentialy) perceived by the client
   * @param productId ID string of product linked to the insurance
   */
  function addNewInsurance(
    bytes32 flightId,
    uint limitArrivalTime,
    uint32 premium,
    uint32 indemnity,
    bytes32 productId)
  public
  onlyIfCreator {
    Insurance memory insuranceToAdd;
    insuranceToAdd.limitArrivalTime = limitArrivalTime;
    insuranceToAdd.premium = premium;
    insuranceToAdd.indemnity = indemnity;
    insuranceToAdd.productId = productId;
    insuranceToAdd.status = 0;
    insuranceList[flightId].push(insuranceToAdd);
    // send an event about the creation of this insurance contract
    InsuranceCreation(flightId, premium, indemnity, productId);
  }
}