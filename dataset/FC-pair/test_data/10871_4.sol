contract c10871{
  /**
   * @dev Manually resolve an insurance contract
   * @param flightId <carrier_code><flight_number>.<timestamp_in_sec_of_departure_date>
   * @param newStatusId ID of the resolution status for this insurance contract
   * @param productId ID string of the product linked to the insurance
   */
  function manualInsuranceResolution(
    bytes32 flightId,
    uint8 newStatusId,
    bytes32 productId)
  public
  onlyIfCreator {
    // go through the list of all insurances related to the given flight
    for (uint i = 0; i < insuranceList[flightId].length; i++) {
      // look for the insurance contract with the correct ID number
      if (areStringsEqual(insuranceList[flightId][i].productId, productId)) {
        // we check this contract is still ongoing before updating it
        if (insuranceList[flightId][i].status == 0) {
          // change the status of the insurance contract to the specified one
          insuranceList[flightId][i].status = newStatusId;
          // send an event about this update
          InsuranceUpdate(
            productId,
            flightId,
            insuranceList[flightId][i].premium,
            insuranceList[flightId][i].indemnity,
            newStatusId
          );
          return;
        }
      }
    }
  }
}