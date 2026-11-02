/**
 * 作者: 苟津源
 * 建立时间: 2026-11-02
 * 使用模型: Trae (proprietary model from Trae team)
 * 功能: 可复用的 Tab 选项卡切换模块 —— 事件监听 + 清除全部选中 + 设置当前选中
 */

/**
 * 核心切换函数：清除全部选中状态，再设置当前元素的选中状态
 * @param {NodeList} headers - 所有 tab 按钮的集合
 * @param {NodeList} panels - 所有内容面板的集合
 * @param {number} activeIndex - 要激活的索引
 */
function gjy_switchTab(headers, panels, activeIndex) {
    // 第一步：清除所有选项卡的选中状态
    for (var i = 0; i < headers.length; i++) {
        headers[i].classList.remove("wy-tab-active");
    }
    for (var j = 0; j < panels.length; j++) {
        panels[j].classList.remove("wy-panel-active");
    }

    // 第二步：设置当前元素的选中状态
    if (headers[activeIndex]) headers[activeIndex].classList.add("wy-tab-active");
    if (panels[activeIndex]) panels[activeIndex].classList.add("wy-panel-active");
}

/**
 * 初始化选项卡组件
 * 查找容器内的 .wy-tab-header 和 .wy-tab-panel，绑定点击事件并设置默认激活项
 * @param {string} containerSelector - 选项卡容器的 CSS 选择器（默认 ".wy-tabs"）
 * @param {number} defaultIndex - 默认激活的选项卡索引（默认 0）
 */
function gjy_initTabs(containerSelector, defaultIndex) {
    if (!containerSelector) containerSelector = ".wy-tabs";
    if (!defaultIndex && defaultIndex !== 0) defaultIndex = 0;

    // 找到页面上所有选项卡容器
    var containers = document.querySelectorAll(containerSelector);

    for (var c = 0; c < containers.length; c++) {
        var container = containers[c];

        // 分别获取 tab 按钮和内容面板
        var headers = container.querySelectorAll(".wy-tab-header");
        var panels = container.querySelectorAll(".wy-tab-panel");

        // 为每个 tab 按钮绑定点击事件监听
        for (var k = 0; k < headers.length; k++) {
            (function (idx) {
                headers[idx].addEventListener("click", function () {
                    // 核心逻辑：清除所有选中状态，再激活当前元素
                    gjy_switchTab(headers, panels, idx);
                });
            })(k);
        }

        // 设置初始激活项
        gjy_switchTab(headers, panels, defaultIndex);
    }
}

// 暴露到 window，方便外部调用调试
window.gjy_initTabs = gjy_initTabs;
window.gjy_switchTab = gjy_switchTab;

// 自动初始化：script 放在 body 末尾时 DOM 已就绪，直接调用
gjy_initTabs(".wy-tabs", 0);
