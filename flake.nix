{
  description = "My Nix flake templates";

  outputs = { self }: {
    templates = {
      nodejs-web = {
        path = ./templates/nodejs-web;
        description = "A development environment with Node.js, pnpm, and Bun";
      };
    };
  };
}
