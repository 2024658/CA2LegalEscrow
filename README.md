# CA2LegalEscrow

# Remix Default Workspace

The **Default Workspace** is initialized when Remix first loads, when creating a new 'Default' template, or when the File Explorer is empty.

### Directory Structure
* **`contracts/`**: Three contracts with increasing complexity.
* **`scripts/`**: TypeScript files for contract deployment.
* **`tests/`**: Unit tests for `Ballot` (Solidity) and `Storage` (JS/Mocha).

---

## Deployment Scripts
The `scripts/` folder uses **ethers.js** to deploy the `Storage` contract. 
* **Customization**: To deploy a different contract, update the contract name and constructor arguments in `deploy_with_ethers.ts`.
* **Execution**: Right-click the script and select **Run**. (Note: The Solidity file must be compiled first).

---

## Important Notes
* **Terminal**: Script output appears in the Remix terminal.
* **Modules**: Remix supports `require/import` for a limited set: `ethers`, `swarmgw`, `chai`, `multihashes`, `remix`, and `hardhat`.
* **Errors**: Unsupported modules will trigger: *"<module_name> module require is not supported by Remix IDE"*.