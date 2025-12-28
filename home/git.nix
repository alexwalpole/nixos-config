{
  programs.git = {
    enable = true;
    userName = "Alex Walpole";
    userEmail = "alexcwalpole@gmail.com";
    ignores = [ ".DS_Store" ];
    
    delta = { 
      enable = true;
      options = { 
        navigate = true;
        line-numbers = true;

      };
    };
  };
}

