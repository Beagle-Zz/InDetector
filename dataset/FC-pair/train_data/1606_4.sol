contract c1606{
	/**
	 * @dev Allows to update to new ENS registry.
	 * @param _registry The address of new ENS registry to use.
	 */
	function updateRegistry(EnsRegistry _registry) public onlyOwner {
		require(registry != _registry, "new registry should be different from old");
		emit RegistryUpdated(registry, _registry);
		registry = _registry;
	}
}