{
  pkgs,
  lib,
  ...
}:
{

  programs.nixvim = {
    # keymaps = {
    #   normal = {
    #     ["<leader>db"] = "DapToggleBreakpoint";
    #     ["<leader>dc"] = "DapContinue";
    #     ["<leader>di"] = "DapStepInto";
    #     ["<leader>do"] = "DapStepOver";
    #     ["<leader>dO"] = "DapStepOut";
    #     ["<leader>dr"] = "DapRestartFrame";
    #     ["<leader>dl"] = "DapRunLast";
    #     ["<leader>du"] = "DapUp";
    #     ["<leader>dd"] = "DapDown";
    #     ["<leader>dt"] = "DapTerminate";
    #   };
    # };
    plugins = {

      neotest.enable = true;
      dap-virtual-text.enable = true;
      dap-ui.enable = true;
      dap.enable = true;
      dap.adapters.servers = {
        "pwa-node" = {
          host = "localhost";
          port = "\${port}";
          executable = {
            command = "node";
            args = [
              "${pkgs.vscode-js-debug}/lib/node_modules/js-debug/dist/src/dapDebugServer.js"
              "\${port}"
            ];
          };
        };
      };
      dap.luaConfig.post = ''
        local dap = require "dap"
        local dapui = require "dapui"

        for _, language in ipairs { "typescript" , "javascript" } do
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              sourceMaps = true,
              processId = require("dap.utils").pick_process,
              cwd = "''${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "launch",
              name = "Debug e2e test file",
              sourceMaps = true,
              program = "''${workspaceFolder}/node_modules/jest/bin/jest",
              args = { "--runInBand", "--config", "''${workspaceFolder}/jest-e2e.json", "''${file}" },
              cwd = "''${workspaceFolder}",
              console = "integratedTerminal",
              env = {
                NODE_ENV = "test",
              },
            },
          }
        end
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      '';
    };
  };
}
