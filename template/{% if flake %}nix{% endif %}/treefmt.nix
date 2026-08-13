_: {
  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        programs = {
          deadnix.enable = true;
          dockerfmt.enable = true;
          nixfmt.enable = true;
          shellcheck.enable = true;
          shfmt.enable = true;
          statix.enable = true;
          typos.enable = true;
          yamlfmt = {
            enable = true;
            settings.formatter = {
              type = "basic";
              eof_newline = true;
              indent = 2;
              pad_line_comments = 2;
              retain_line_breaks_single = true;
              scan_folded_as_literal = true;
              trim_trailing_whitespace = true;
            };
          };
        };

        # Use golangci-lint fmt as a Go formatter
        settings.formatter.golangci-lint-fmt = {
          command = "${pkgs.golangci-lint}/bin/golangci-lint";
          options = [ "fmt" ];
          includes = [ "*.go" ];
        };
      };
    };
}
