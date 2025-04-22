/**
 * 智慧农场小程序统一交互脚本
 * 提供全局通用的交互功能和动画效果
 */

document.addEventListener('DOMContentLoaded', function() {
    // 初始化页面交互效果
    initPageInteractions();
    
    // 初始化动画效果
    initAnimations();
    
    // 初始化通知系统
    initNotifications();
    
    // 初始化模态框
    initModals();
    
    // 初始化设备控制面板（如果存在）
    if (document.querySelector('.device-control-panel')) {
        initDeviceControlPanel();
    }
    
    // 初始化图表（如果页面中有图表）
    if (document.querySelector('.chart-container')) {
        initCharts();
    }
    
    // 初始化表单验证
    initFormValidation();
    
    // 初始化列表动画
    initListAnimations();
    
    // 初始化下拉刷新
    initPullToRefresh();
});

/**
 * 初始化页面交互效果
 */
function initPageInteractions() {
    // 为所有卡片和按钮添加点击波纹效果
    document.querySelectorAll('.card, .btn, .feature-card, .data-card, .inventory-card').forEach(element => {
        element.classList.add('ripple');
        element.classList.add('btn-press');
    });
    
    // 为卡片添加悬浮效果
    document.querySelectorAll('.card, .feature-card, .data-card, .inventory-card').forEach(element => {
        element.classList.add('hover-float');
    });
    
    // 为标签页添加点击事件
    document.querySelectorAll('[data-tab]').forEach(tab => {
        tab.addEventListener('click', function() {
            const tabGroup = this.getAttribute('data-tab-group');
            const tabId = this.getAttribute('data-tab');
            
            // 移除同组标签页的active类
            document.querySelectorAll(`[data-tab-group="${tabGroup}"]`).forEach(item => {
                item.classList.remove('tab-active');
            });
            
            // 隐藏所有相关的标签内容
            document.querySelectorAll(`[data-tab-content-group="${tabGroup}"]`).forEach(content => {
                content.classList.add('hidden');
            });
            
            // 为当前点击的标签页添加active类
            this.classList.add('tab-active');
            
            // 显示对应的标签内容
            const tabContent = document.querySelector(`[data-tab-content="${tabId}"]`);
            if (tabContent) {
                tabContent.classList.remove('hidden');
                // 添加动画效果
                tabContent.classList.add('fade-in');
                // 移除动画类，以便下次切换时重新触发
                setTimeout(() => {
                    tabContent.classList.remove('fade-in');
                }, 500);
            }
        });
    });
    
    // 为任务复选框添加点击事件
    document.querySelectorAll('.task-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const taskItem = this.closest('.task-item');
            if (this.checked) {
                taskItem.classList.add('completed');
                // 添加完成动画
                taskItem.classList.add('data-update-flash');
                setTimeout(() => {
                    taskItem.classList.remove('data-update-flash');
                }, 1000);
                // 可以在这里添加任务完成的API调用
            } else {
                taskItem.classList.remove('completed');
            }
        });
    });
    
    // 为所有按钮添加点击反馈
    document.querySelectorAll('button, .btn').forEach(button => {
        button.addEventListener('click', function() {
            this.classList.add('btn-press');
            setTimeout(() => {
                this.classList.remove('btn-press');
            }, 200);
        });
    });
}

/**
 * 初始化动画效果
 */
function initAnimations() {
    // 为页面主要内容添加进入动画
    const mainContent = document.querySelector('main');
    if (mainContent) {
        mainContent.classList.add('page-transition');
        setTimeout(() => {
            mainContent.classList.add('show');
        }, 100);
    }
    
    // 为功能卡片添加交错动画
    const featureCards = document.querySelectorAll('.feature-card');
    featureCards.forEach((card, index) => {
        card.classList.add('staggered-item');
        setTimeout(() => {
            card.classList.add('show');
        }, 100 + (index * 100));
    });
    
    // 为数据卡片添加动画
    const dataCards = document.querySelectorAll('.data-card');
    dataCards.forEach((card, index) => {
        card.classList.add('staggered-item');
        setTimeout(() => {
            card.classList.add('show');
        }, 100 + (index * 100));
    });
    
    // 为状态指示器添加动画
    document.querySelectorAll('.status-indicator').forEach(indicator => {
        if (indicator.classList.contains('status-warning') || indicator.classList.contains('status-danger')) {
            indicator.classList.add('blink');
        }
    });
    
    // 为进度条添加动画
    document.querySelectorAll('.progress-value').forEach(progress => {
        progress.classList.add('progress-animate');
    });
}

/**
 * 初始化通知系统
 */
function initNotifications() {
    // 创建通知容器
    if (!document.getElementById('notification-container')) {
        const notificationContainer = document.createElement('div');
        notificationContainer.id = 'notification-container';
        notificationContainer.style.position = 'fixed';
        notificationContainer.style.top = '1rem';
        notificationContainer.style.right = '1rem';
        notificationContainer.style.zIndex = '1000';
        document.body.appendChild(notificationContainer);
    }
    
    // 全局通知函数
    window.showNotification = function(message, type = 'success', duration = 3000) {
        const notification = document.createElement('div');
        notification.className = `notification-popup ${type}`;
        notification.style.padding = '0.75rem 1rem';
        notification.style.marginBottom = '0.5rem';
        notification.style.borderRadius = '0.375rem';
        notification.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
        notification.style.maxWidth = '300px';
        
        // 设置不同类型的样式
        if (type === 'success') {
            notification.style.backgroundColor = '#07c160';
            notification.style.color = 'white';
        } else if (type === 'warning') {
            notification.style.backgroundColor = '#ff9800';
            notification.style.color = 'white';
        } else if (type === 'error') {
            notification.style.backgroundColor = '#ff3b30';
            notification.style.color = 'white';
        } else if (type === 'info') {
            notification.style.backgroundColor = '#2196f3';
            notification.style.color = 'white';
        }
        
        notification.textContent = message;
        
        const container = document.getElementById('notification-container');
        container.appendChild(notification);
        
        // 显示通知
        setTimeout(() => {
            notification.classList.add('show');
        }, 10);
        
        // 自动关闭通知
        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                notification.remove();
            }, 500);
        }, duration);
    };
}

/**
 * 初始化模态框
 */
function initModals() {
    // 为所有模态框触发器添加点击事件
    document.querySelectorAll('[data-modal-target]').forEach(trigger => {
        trigger.addEventListener('click', function() {
            const modalId = this.getAttribute('data-modal-target');
            const modal = document.getElementById(modalId);
            
            if (modal) {
                // 显示模态框
                modal.classList.remove('hidden');
                modal.classList.add('fade-panel');
                setTimeout(() => {
                    modal.classList.add('show');
                }, 10);
                
                // 禁止背景滚动
                document.body.style.overflow = 'hidden';
                
                // 为关闭按钮添加事件
                modal.querySelectorAll('[data-modal-close]').forEach(closeBtn => {
                    closeBtn.addEventListener('click', function() {
                        modal.classList.remove('show');
                        setTimeout(() => {
                            modal.classList.add('hidden');
                            document.body.style.overflow = '';
                        }, 300);
                    });
                });
                
                // 点击背景关闭模态框
                modal.addEventListener('click', function(e) {
                    if (e.target === this) {
                        modal.classList.remove('show');
                        setTimeout(() => {
                            modal.classList.add('hidden');
                            document.body.style.overflow = '';
                        }, 300);
                    }
                });
            }
        });
    });
}

/**
 * 初始化设备控制面板
 */
function initDeviceControlPanel() {
    // 为所有设备控制面板触发器添加点击事件
    document.querySelectorAll('[data-device-control]').forEach(trigger => {
        trigger.addEventListener('click', function() {
            const deviceId = this.getAttribute('data-device-id');
            const deviceName = this.getAttribute('data-device-name') || '设备';
            const deviceType = this.getAttribute('data-device-type') || 'unknown';
            const controlPanel = document.querySelector('.device-control-panel');
            
            if (controlPanel) {
                // 更新面板标题
                const panelTitle = controlPanel.querySelector('.panel-title');
                if (panelTitle) {
                    panelTitle.textContent = deviceName + '控制';
                }
                
                // 根据设备类型显示不同的控制选项
                const controlOptions = controlPanel.querySelector('.control-options');
                if (controlOptions) {
                    // 清空现有选项
                    controlOptions.innerHTML = '';
                    
                    // 根据设备类型添加不同的控制选项
                    if (deviceType === 'irrigation') {
                        // 灌溉设备控制选项
                        controlOptions.innerHTML = `
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700 mb-2">灌溉强度</label>
                                <input type="range" class="slider" min="0" max="100" value="50" id="irrigation-intensity">
                                <div class="flex justify-between text-xs text-gray-500">
                                    <span>低</span>
                                    <span>中</span>
                                    <span>高</span>
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700 mb-2">定时设置</label>
                                <div class="grid grid-cols-2 gap-2">
                                    <div>
                                        <label class="text-xs text-gray-500">开始时间</label>
                                        <input type="time" class="w-full p-2 border border-gray-300 rounded-lg">
                                    </div>
                                    <div>
                                        <label class="text-xs text-gray-500">结束时间</label>
                                        <input type="time" class="w-full p-2 border border-gray-300 rounded-lg">
                                    </div>
                                </div>
                            </div>
                            <div class="flex justify-between items-center mb-4">
                                <span class="text-sm font-medium text-gray-700">自动模式</span>
                                <label class="toggle-switch">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        `;
                    } else if (deviceType === 'monitor') {
                        // 监控设备控制选项
                        controlOptions.innerHTML = `
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700 mb-2">刷新频率</label>
                                <select class="w-full p-2 border border-gray-300 rounded-lg">
                                    <option value="5">5秒</option>
                                    <option value="10">10秒</option>
                                    <option value="30" selected>30秒</option>
                                    <option value="60">1分钟</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700 mb-2">报警阈值</label>
                                <input type="range" class="slider" min="0" max="100" value="70" id="alarm-threshold">
                                <div class="flex justify-between text-xs text-gray-500">
                                    <span>低</span>
                                    <span>中</span>
                                    <span>高</span>
                                </div>
                            </div>
                            <div class="flex justify-between items-center mb-4">
                                <span class="text-sm font-medium text-gray-700">报警通知</span>
                                <label class="toggle-switch">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                        `;
                    } else {
                        // 默认控制选项
                        controlOptions.innerHTML = `
                            <div class="flex justify-between items-center mb-4">
                                <span class="text-sm font-medium text-gray-700">设备开关</span>
                                <label class="toggle-switch">
                                    <input type="checkbox" checked>
                                    <span class="toggle-slider"></span>
                                </label>
                            </div>
                            <div class="mb-4">
                                <label class="block text-sm font-medium text-gray-700 mb-2">运行模式</label>
                                <select class="w-full p-2 border border-gray-300 rounded-lg">
                                    <option value="auto">自动模式</option>
                                    <option value="manual">手动模式</option>
                                    <option value="eco">节能模式</option>
                                </select>
                            </div>
                        `;
                    }
                }
                
                // 显示控制面板
                controlPanel.classList.add('slide-in-panel');
                controlPanel.classList.remove('hidden');
                setTimeout(() => {
                    controlPanel.classList.add('show');
                }, 10);
                
                // 为关闭按钮添加事件
                const closeBtn = controlPanel.querySelector('[data-panel-close]');
                if (closeBtn) {
                    closeBtn.addEventListener('click', function() {
                        controlPanel.classList.remove('show');
                        setTimeout(() => {
                            controlPanel.classList.add('hidden');
                        }, 300);
                    });
                }
                
                // 为保存按钮添加事件
                const saveBtn = controlPanel.querySelector('[data-panel-save]');
                if (saveBtn) {
                    saveBtn.addEventListener('click', function() {
                        // 模拟保存设置
                        controlPanel.classList.remove('show');
                        setTimeout(() => {
                            controlPanel.classList.add('hidden');
                            // 显示保存成功通知
                            if (window.showNotification) {
                                window.showNotification('设备设置已保存', 'success');
                            }
                        }, 300);
                    });
                }
            }
        });
    });
}

/**
 * 初始化图表
 */
function initCharts() {
    // 这里可以集成图表库，如ECharts或Chart.js
    // 为了简化，这里使用一个简单的模拟图表
    document.querySelectorAll('.chart-container').forEach(container => {
        // 添加加载动画
        container.classList.add('chart-loading');
        
        // 模拟加载数据
        setTimeout(() => {
            container.classList.remove('chart-loading');
            
            // 如果是简单的SVG图表，可以直接创建
            if (container.classList.contains('simple-chart')) {
                const svgNS = "http://www.w3.org/2000/svg";
                const svg = document.createElementNS(svgNS, "svg");
                svg.setAttribute("width", "100%");
                svg.setAttribute("height", "100%");
                svg.setAttribute("viewBox", "0 0 100 50");
                
                // 创建渐变
                const defs = document.createElementNS(svgNS, "defs");
                const gradient = document.createElementNS(svgNS, "linearGradient");
                gradient.setAttribute("id", "chart-gradient");
                gradient.setAttribute("x1", "0%");
                gradient.setAttribute("y1", "0%");
                gradient.setAttribute("x2", "0%");
                gradient.setAttribute("y2", "100%");
                
                const stop1 = document.createElementNS(svgNS, "stop");
                stop1.setAttribute("offset", "0%");
                stop1.setAttribute("stop-color", "#07c160");
                
                const stop2 = document.createElementNS(svgNS, "stop");
                stop2.setAttribute("offset", "100%");
                stop2.setAttribute("stop-color", "#07c160");
                stop2.setAttribute("stop-opacity", "0.2");
                
                gradient.appendChild(stop1);
                gradient.appendChild(stop2);
                defs.appendChild(gradient);
                svg.appendChild(defs);
                
                // 创建网格线
                for (let i = 0; i < 6; i++) {
                    const line = document.createElementNS(svgNS, "line");
                    line.setAttribute("x1", "0");
                    line.setAttribute("y1", i * 10);
                    line.setAttribute("x2", "100");
                    line.setAttribute("y2", i * 10);
                    line.setAttribute("stroke", "#e5e5e5");
                    line.setAttribute("stroke-width", "0.5");
                    svg.appendChild(line);
                }
                
                // 创建随机数据点
                const points = [];
                for (let i = 0; i < 10; i++) {
                    points.push([i * 10, 40 - Math.random() * 30]);
                }
                
                // 创建折线
                let pathD = `M${points[0][0]},${points[0][1]}`;
                for (let i = 1; i < points.length; i++) {
                    pathD += ` L${points[i][0]},${points[i][1]}`;
                }
                
                const path = document.createElementNS(svgNS, "path");
                path.setAttribute("d", pathD);
                path.setAttribute("stroke", "#07c160");
                path.setAttribute("stroke-width", "2");
                path.setAttribute("fill", "none");
                svg.appendChild(path);
                
                // 创建面积
                const areaD = `${pathD} L${points[points.length-1][0]},50 L${points[0][0]},50 Z`;
                const area = document.createElementNS(svgNS, "path");
                area.setAttribute("d", areaD);
                area.setAttribute("fill", "url(#chart-gradient)");
                area.setAttribute("opacity", "0.5");
                svg.appendChild(area);
                
                // 创建数据点
                points.forEach(point => {
                    const circle = document.createElementNS(svgNS, "circle");
                    circle.setAttribute("cx", point[0]);
                    circle.setAttribute("cy", point[1]);
                    circle.setAttribute("r", "2");
                    circle.setAttribute("fill", "#07c160");
                    circle.setAttribute("stroke", "white");
                    circle.setAttribute("stroke-width", "1");
                    svg.appendChild(circle);
                });
                
                container.appendChild(svg);
                
                // 添加动画效果
                path.style.strokeDasharray = path.getTotalLength();
                path.style.strokeDashoffset = path.getTotalLength();
                path.style.animation = 'dash 1.5s ease-in-out forwards';
                
                const style = document.createElement('style');
                style.textContent = `
                    @keyframes dash {
                        to {
                            stroke-dashoffset: 0;
                        }
                    }
                `;
                document.head.appendChild(style);
            }
        }, 1000);
    });
}

/**
 * 初始化表单验证
 */
function initFormValidation() {
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            let isValid = true;
            
            // 验证必填字段
            form.querySelectorAll('[required]').forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    const errorMsg = field.nextElementSibling;
                    if (errorMsg && errorMsg.classList.contains('error-message')) {
                        errorMsg.textContent = '此字段为必填项';
                    } else {
                        const error = document.createElement('p');
                        error.className = 'error-message text-red-500 text-xs mt-1';
                        error.textContent = '此字段为必填项';
                        field.parentNode.insertBefore(error, field.nextSibling);
                    }
                } else {
                    field.classList.remove('border-red-500');
                    const errorMsg = field.nextElementSibling;
                    if (errorMsg && errorMsg.classList.contains('error-message')) {
                        errorMsg.textContent = '';
                    }
                }
            });
            
            // 验证邮箱格式
            form.querySelectorAll('[type="email"]').forEach(field => {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (field.value.trim() && !emailRegex.test(field.value)) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    const errorMsg = field.nextElementSibling;
                    if (errorMsg && errorMsg.classList.contains('error-message')) {
                        errorMsg.textContent = '请输入有效的邮箱地址';
                    } else {
                        const error = document.createElement('p');
                        error.className = 'error-message text-red-500 text-xs mt-1';
                        error.textContent = '请输入有效的邮箱地址';
                        field.parentNode.insertBefore(error, field.nextSibling);
                    }
                }
            });
            
            // 验证手机号格式
            form.querySelectorAll('[data-validate="phone"]').forEach(field => {
                const phoneRegex = /^1[3-9]\d{9}$/;
                if (field.value.trim() && !phoneRegex.test(field.value)) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    const errorMsg = field.nextElementSibling;
                    if (errorMsg && errorMsg.classList.contains('error-message')) {
                        errorMsg.textContent = '请输入有效的手机号码';
                    } else {
                        const error = document.createElement('p');
                        error.className = 'error-message text-red-500 text-xs mt-1';
                        error.textContent = '请输入有效的手机号码';
                        field.parentNode.insertBefore(error, field.nextSibling);
                    }
                }
            });
            
            // 验证密码长度
            form.querySelectorAll('[type="password"]').forEach(field => {
                if (field.value.trim() && field.value.length < 6) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    const errorMsg = field.nextElementSibling;
                    if (errorMsg && errorMsg.classList.contains('error-message')) {
                        errorMsg.textContent = '密码长度至少为6位';
                    } else {
                        const error = document.createElement('p');
                        error.className = 'error-message text-red-500 text-xs mt-1';
                        error.textContent = '密码长度至少为6位';
                        field.parentNode.insertBefore(error, field.nextSibling);
                    }
                }
            });
            
            // 验证密码确认
            const password = form.querySelector('[name="password"]');
            const confirmPassword = form.querySelector('[name="confirm_password"]');
            if (password && confirmPassword && password.value !== confirmPassword.value) {
                isValid = false;
                confirmPassword.classList.add('border-red-500');
                
                // 添加错误提示
                const errorMsg = confirmPassword.nextElementSibling;
                if (errorMsg && errorMsg.classList.contains('error-message')) {
                    errorMsg.textContent = '两次输入的密码不一致';
                } else {
                    const error = document.createElement('p');
                    error.className = 'error-message text-red-500 text-xs mt-1';
                    error.textContent = '两次输入的密码不一致';
                    confirmPassword.parentNode.insertBefore(error, confirmPassword.nextSibling);
                }
            }
            
            // 如果验证不通过，阻止表单提交
            if (!isValid) {
                e.preventDefault();
                
                // 显示错误通知
                if (window.showNotification) {
                    window.showNotification('表单验证失败，请检查输入', 'error');
                }
                
                // 滚动到第一个错误字段
                const firstError = form.querySelector('.border-red-500');
                if (firstError) {
                    firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    firstError.focus();
                }
            } else {
                // 模拟表单提交成功
                if (form.getAttribute('data-demo') === 'true') {
                    e.preventDefault();
                    
                    // 显示加载状态
                    const submitBtn = form.querySelector('[type="submit"]');
                    if (submitBtn) {
                        const originalText = submitBtn.textContent;
                        submitBtn.disabled = true;
                        submitBtn.innerHTML = '<div class="loading-spinner inline-block mr-2"></div> 提交中...';
                        
                        // 模拟请求延迟
                        setTimeout(() => {
                            // 恢复按钮状态
                            submitBtn.disabled = false;
                            submitBtn.textContent = originalText;
                            
                            // 显示成功通知
                            if (window.showNotification) {
                                window.showNotification('操作成功', 'success');
                            }
                            
                            // 可以在这里添加其他成功后的操作，如重定向
                            // window.location.href = 'success.html';
                        }, 1500);
                    }
                }
            }
        });
    });
}

/**
 * 初始化列表动画
 */
function initListAnimations() {
    // 为列表项添加交错动画
    const listItems = document.querySelectorAll('.list-item');
    listItems.forEach((item, index) => {
        item.classList.add('list-item-slide');
        setTimeout(() => {
            item.classList.add('show');
        }, 100 + (index * 50));
    });
    
    // 为任务列表项添加交错动画
    const taskItems = document.querySelectorAll('.task-item');
    taskItems.forEach((item, index) => {
        item.classList.add('staggered-item');
        setTimeout(() => {
            item.classList.add('show');
        }, 100 + (index * 50));
    });
}

/**
 * 初始化下拉刷新
 */
function initPullToRefresh() {
    // 创建下拉刷新指示器
    if (!document.getElementById('pull-to-refresh-indicator')) {
        const indicator = document.createElement('div');
        indicator.id = 'pull-to-refresh-indicator';
        indicator.className = 'fixed top-0 left-0 right-0 flex items-center justify-center py-2 bg-white shadow-md transform -translate-y-full transition-transform duration-300 z-50';
        indicator.innerHTML = `
            <div class="loading-spinner mr-2"></div>
            <span>下拉刷新</span>
        `;
        document.body.prepend(indicator);
    }
    
    // 下拉刷新变量
    let touchStartY = 0;
    let touchEndY = 0;
    let isRefreshing = false;
    const minDistance = 80; // 最小下拉距离
    const indicator = document.getElementById('pull-to-refresh-indicator');
    
    // 触摸开始事件
    document.addEventListener('touchstart', function(e) {
        // 只有在页面顶部才启用下拉刷新
        if (window.scrollY === 0) {
            touchStartY = e.touches[0].clientY;
        }
    }, { passive: true });
    
    // 触摸移动事件
    document.addEventListener('touchmove', function(e) {
        if (touchStartY > 0 && !isRefreshing) {
            touchEndY = e.touches[0].clientY;
            const distance = touchEndY - touchStartY;
            
            // 只有下拉时才显示指示器
            if (distance > 0) {
                // 计算下拉距离，使用阻尼效果
                const pullDistance = Math.min(distance * 0.5, minDistance);
                const progress = pullDistance / minDistance;
                
                // 更新指示器位置
                indicator.style.transform = `translateY(${pullDistance}px)`;
                
                // 更新指示器文本
                const indicatorText = indicator.querySelector('span');
                if (indicatorText) {
                    indicatorText.textContent = progress >= 1 ? '释放刷新' : '下拉刷新';
                }
                
                // 阻止默认滚动
                if (distance > 10) {
                    e.preventDefault();
                }
            }
        }
    }, { passive: false });
    
    // 触摸结束事件
    document.addEventListener('touchend', function() {
        if (touchStartY > 0 && touchEndY > 0 && !isRefreshing) {
            const distance = touchEndY - touchStartY;
            
            if (distance > minDistance) {
                // 触发刷新
                isRefreshing = true;
                
                // 更新指示器
                indicator.style.transform = 'translateY(0)';
                const indicatorText = indicator.querySelector('span');
                if (indicatorText) {
                    indicatorText.textContent = '刷新中...';
                }
                
                // 模拟刷新操作
                setTimeout(() => {
                    // 重置指示器
                    indicator.style.transform = 'translateY(-100%)';
                    
                    // 重置变量
                    touchStartY = 0;
                    touchEndY = 0;
                    isRefreshing = false;
                    
                    // 显示刷新成功通知
                    if (window.showNotification) {
                        window.showNotification('刷新成功', 'success');
                    }
                    
                    // 添加页面刷新动画
                    const mainContent = document.querySelector('main');
                    if (mainContent) {
                        mainContent.classList.add('fade-in');
                        setTimeout(() => {
                            mainContent.classList.remove('fade-in');
                        }, 500);
                    }
                    
                    // 可以在这里添加实际的数据刷新逻辑
                }, 1500);
            } else {
                // 未达到刷新阈值，重置指示器
                indicator.style.transform = 'translateY(-100%)';
                touchStartY = 0;
                touchEndY = 0;
            }
        }
    }, { passive: true });
}