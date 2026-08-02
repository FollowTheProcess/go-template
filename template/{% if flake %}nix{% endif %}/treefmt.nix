_: {
  perSystem.treefmt.programs = {
    deadnix.enable = true;
    gofmt.enable = true;
    nixfmt.enable = true;
    shellcheck.enable = true;
    shfmt.enable = true;
    statix.enable = true;
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
}
