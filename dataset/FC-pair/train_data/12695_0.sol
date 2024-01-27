contract c12695{
         /**
         * @notice allows owner to change the treasury in case of hack/lost keys.
         * @dev Marked external because it is never called from this contract.
         */
         function changeTreasury(address _newTreasury) external onlyOwner{
             treasury = _newTreasury;
             emit ChangeTreasury(msg.sender, _newTreasury);
         }
}