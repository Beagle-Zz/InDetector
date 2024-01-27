contract c10871{
  /**
   * @dev Update the status of a flight
   * @param flightId <carrier_code><flight_number>.<timestamp_in_sec_of_departure_date>
   * @param actualArrivalTime The actual arrival time of the flight (timestamp in sec)
   */
  function updateFlightStatus(
    bytes32 flightId,
    uint actualArrivalTime)
  public
  onlyIfCreator {
    uint8 newStatus = 1;
    // go through the list of all insurances related to the given flight
    for (uint i = 0; i < insuranceList[flightId].length; i++) {
      // we check this contract is still ongoing before updating it
      if (insuranceList[flightId][i].status == 0) {
        newStatus = 1;
        // if the actual arrival time is over the limit the user wanted,
        // we trigger the indemnity, which means status = 2
        if (actualArrivalTime > insuranceList[flightId][i].limitArrivalTime) {
          newStatus = 2;
        }
        // update the status of the insurance contract
        insuranceList[flightId][i].status = newStatus;
        // send an event about this update for each insurance
        InsuranceUpdate(
          insuranceList[flightId][i].productId,
          flightId,
          insuranceList[flightId][i].premium,
          insuranceList[flightId][i].indemnity,
          newStatus
        );
      }
    }
  }
}