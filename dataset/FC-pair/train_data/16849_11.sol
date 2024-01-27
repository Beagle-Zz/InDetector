contract c16849{
    /// @notice Update a DAppNode package
    /// @param idPackage the id of the package to be changed
    /// @param name the new ENS name of the package
    /// @param repo the new AragonPackageManager address of the repo.
    function updatePackage (
        uint idPackage,
        string name,
        address repo
    ) onlyOwner public {
        require(idPackage < DAppNodePackages.length);
        DAppNodePackage storage c = DAppNodePackages[idPackage];
        c.name = name;
        c.repo = repo;
        // An event to notify that a package has been updated
        PackageUpdated(idPackage,name,repo);
    }
}