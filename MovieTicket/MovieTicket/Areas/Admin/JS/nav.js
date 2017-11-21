var mLayout = function () {
    s = function () {
        $("#m_aside_left_minimize_toggle").mToggle({
            target: "body",
            targetState: "m-brand--minimize m-aside-left--minimize",
            togglerState: "m-brand__toggler--active"
        }).on("toggle", function () {
            e.pauseDropdownHover(800), t.pauseDropdownHover(800)
        }), $("#m_aside_left_hide_toggle").mToggle({
            target: "body",
            targetState: "m-aside-left--hide",
            togglerState: "m-brand__toggler--active"
        }).on("toggle", function () {
            e.pauseDropdownHover(800), t.pauseDropdownHover(800)
        })
    };
    return {
        init: function () {this.initAside()},
        initAside: function () {s()},
    }
}