/**
 * 智慧农场小程序交互脚本
 */

document.addEventListener('DOMContentLoaded', function() {
    // 初始化页面交互效果
    initPageInteractions();
    
    // 初始化响应式布局
    initResponsiveLayout();
    
    // 初始化表单验证
    initFormValidation();
    
    // 初始化动画效果
    initAnimations();
    
    // 初始化通知系统
    initNotifications();
    
    // 初始化模态框
    initModals();
    
    // 初始化设备控制面板
    initDeviceControlPanel();
    
    // 初始化图表（如果页面中有图表）
    if (document.querySelector('.chart-container')) {
        initCharts();
    }
});

/**
 * 初始化页面交互效果
 */
function initPageInteractions() {
    // 为所有卡片添加点击波纹效果
    document.querySelectorAll('.card, .btn, .nav-item').forEach(element => {
        element.classList.add('touch-feedback');
    });
    
    // 为导航项添加点击事件
    document.querySelectorAll('.nav-item').forEach(navItem => {
        navItem.addEventListener('click', function() {
            // 移除所有导航项的active类
            document.querySelectorAll('.nav-item').forEach(item => {
                item.classList.remove('active');
            });
            // 为当前点击的导航项添加active类
            this.classList.add('active');
        });
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
                content.style.display = 'none';
            });
            
            // 为当前点击的标签页添加active类
            this.classList.add('tab-active');
            
            // 显示对应的标签内容
            const tabContent = document.querySelector(`[data-tab-content="${tabId}"]`);
            if (tabContent) {
                tabContent.style.display = 'block';
            }
        });
    });
    
    // 为任务复选框添加点击事件
    document.querySelectorAll('.task-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const taskItem = this.closest('.task-item');
            if (this.checked) {
                taskItem.classList.add('completed');
                // 可以在这里添加任务完成的API调用
            } else {
                taskItem.classList.remove('completed');
            }
        });
    });
}

/**
 * 初始化响应式布局
 */
function initResponsiveLayout() {
    // 检测设备类型并添加相应的类
    const isMobile = window.innerWidth < 640;
    document.body.classList.add(isMobile ? 'is-mobile' : 'is-desktop');
    
    // 检测是否支持深色模式
    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
        // 用户偏好深色模式
        document.body.classList.add('dark-mode-support');
    }
    
    // 监听系统深色模式变化
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', event => {
        if (event.matches) {
            document.body.classList.add('dark-mode-support');
        } else {
            document.body.classList.remove('dark-mode-support');
        }
    });
    
    // 监听窗口大小变化
    window.addEventListener('resize', function() {
        const newIsMobile = window.innerWidth < 640;
        if (newIsMobile && !document.body.classList.contains('is-mobile')) {
            document.body.classList.remove('is-desktop');
            document.body.classList.add('is-mobile');
        } else if (!newIsMobile && !document.body.classList.contains('is-desktop')) {
            document.body.classList.remove('is-mobile');
            document.body.classList.add('is-desktop');
        }
        
        // 重新调整图表大小（如果存在）
        if (typeof resizeCharts === 'function') {
            resizeCharts();
        }
    });
    
    // 处理安全区域
    updateSafeArea();
    window.addEventListener('resize', updateSafeArea);
    
    // 添加设备方向变化监听
    window.addEventListener('orientationchange', function() {
        // 延迟执行以确保方向变化完成
        setTimeout(function() {
            updateSafeArea();
            // 重新调整图表大小（如果存在）
            if (typeof resizeCharts === 'function') {
                resizeCharts();
            }
        }, 300);
    });
}

/**
 * 更新安全区域
 */
function updateSafeArea() {
    const safeAreaElements = document.querySelectorAll('.safe-area');
    safeAreaElements.forEach(element => {
        // 根据设备方向调整安全区域
        if (window.innerHeight > window.innerWidth) {
            // 竖屏
            element.style.paddingTop = 'env(safe-area-inset-top)';
            element.style.paddingBottom = 'env(safe-area-inset-bottom)';
        } else {
            // 横屏
            element.style.paddingLeft = 'env(safe-area-inset-left)';
            element.style.paddingRight = 'env(safe-area-inset-right)';
        }
    });
}

/**
 * 初始化表单验证
 */
function initFormValidation() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', function(event) {
            let isValid = true;
            
            // 验证必填字段
            form.querySelectorAll('[required]').forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    let errorMsg = field.nextElementSibling;
                    if (!errorMsg || !errorMsg.classList.contains('error-message')) {
                        errorMsg = document.createElement('p');
                        errorMsg.classList.add('error-message', 'text-red-500', 'text-xs', 'mt-1');
                        field.parentNode.insertBefore(errorMsg, field.nextSibling);
                    }
                    errorMsg.textContent = '此字段不能为空';
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
                if (field.value.trim() && !emailRegex.test(field.value.trim())) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    let errorMsg = field.nextElementSibling;
                    if (!errorMsg || !errorMsg.classList.contains('error-message')) {
                        errorMsg = document.createElement('p');
                        errorMsg.classList.add('error-message', 'text-red-500', 'text-xs', 'mt-1');
                        field.parentNode.insertBefore(errorMsg, field.nextSibling);
                    }
                    errorMsg.textContent = '请输入有效的邮箱地址';
                }
            });
            
            // 验证手机号格式
            form.querySelectorAll('[data-validate="phone"]').forEach(field => {
                const phoneRegex = /^1[3-9]\d{9}$/;
                if (field.value.trim() && !phoneRegex.test(field.value.trim())) {
                    isValid = false;
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    let errorMsg = field.nextElementSibling;
                    if (!errorMsg || !errorMsg.classList.contains('error-message')) {
                        errorMsg = document.createElement('p');
                        errorMsg.classList.add('error-message', 'text-red-500', 'text-xs', 'mt-1');
                        field.parentNode.insertBefore(errorMsg, field.nextSibling);
                    }
                    errorMsg.textContent = '请输入有效的手机号码';
                }
            });
            
            if (!isValid) {
                event.preventDefault();
                showNotification('请检查表单中的错误', 'error');
            }
        });
        
        // 实时验证
        form.querySelectorAll('input, textarea, select').forEach(field => {
            field.addEventListener('blur', function() {
                // 验证必填字段
                if (field.hasAttribute('required') && !field.value.trim()) {
                    field.classList.add('border-red-500');
                    
                    // 添加错误提示
                    let errorMsg = field.nextElementSibling;
                    if (!errorMsg || !errorMsg.classList.contains('error-message')) {
                        errorMsg = document.createElement('p');
                        errorMsg.classList.add('error-message', 'text-red-500', 'text-xs', 'mt-1');
                        field.parentNode.insertBefore(errorMsg, field.nextSibling);
                    }
                    errorMsg.textContent = '此字段不能为空';
                } else {
                    field.classList.remove('border-red-500');
                    const errorMsg = field.nextElementSibling;
                    if (errorMsg && errorMsg.classList.contains('error-message')) {
                        errorMsg.textContent = '';
                    }
                }
            });
        });
    });
}

/**
 * 初始化动画效果
 */
function initAnimations() {
    // 为所有卡片添加进入动画
    const cards = document.querySelectorAll('.card');
    cards.forEach((card, index) => {
        card.classList.add('fade-in');
        card.style.animationDelay = `${index * 0.1}s`;
    });
    
    // 为列表项添加进入动画
    const listItems = document.querySelectorAll('.list-item');
    listItems.forEach((item, index) => {
        item.classList.add('slide-up');
        item.style.animationDelay = `${index * 0.05}s`;
    });
    
    // 添加滚动动画
    document.addEventListener('scroll', function() {
        const animateElements = document.querySelectorAll('.animate-on-scroll');
        animateElements.forEach(element => {
            if (isElementInViewport(element) && !element.classList.contains('animated')) {
                element.classList.add('animated', 'fade-in');
            }
        });
    });
}

/**
 * 检查元素是否在视口中
 */
function isElementInViewport(el) {
    const rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
}

/**
 * 初始化通知系统
 */
function initNotifications() {
    // 查找通知容器
    let notificationContainer = document.querySelector('.notification-container');
    
    // 如果不存在，则创建一个
    if (!notificationContainer) {
        notificationContainer = document.createElement('div');
        notificationContainer.className = 'notification-container fixed top-0 right-0 p-4 z-50 flex flex-col items-end space-y-2';
        document.body.appendChild(notificationContainer);
    }
    
    // 初始化未读消息徽章
    updateNotificationBadge();
    
    // 为通知按钮添加点击事件
    const notificationButtons = document.querySelectorAll('.notification-btn');
    notificationButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            // 显示通知面板
            showNotificationPanel();
        });
    });
    
    // 如果在首页，显示欢迎通知
    if (window.location.pathname.endsWith('index.html') || window.location.pathname.endsWith('/')) {
        setTimeout(function() {
            showNotification('欢迎使用智慧农场小程序', 'success');
        }, 1000);
    }
}

/**
 * 显示通知面板
 */
function showNotificationPanel() {
    // 查找或创建通知面板
    let notificationPanel = document.querySelector('.notification-panel');
    
    if (!notificationPanel) {
        notificationPanel = document.createElement('div');
        notificationPanel.className = 'notification-panel fixed inset-0 bg-black bg-opacity-50 z-50 flex justify-end transform translate-x-full transition-transform duration-300 ease-in-out';
        
        const panelContent = document.createElement('div');
        panelContent.className = 'bg-white h-full w-4/5 max-w-md flex flex-col';
        
        // 面板头部
        const panelHeader = document.createElement('div');
        panelHeader.className = 'flex items-center justify-between p-4 border-b';
        panelHeader.innerHTML = `
            <h2 class="text-lg font-bold">消息通知</h2>
            <button class="close-panel-btn p-2 rounded-full hover:bg-gray-100">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        `;
        
        // 面板内容
        const panelBody = document.createElement('div');
        panelBody.className = 'flex-1 overflow-y-auto p-4';
        
        // 示例通知
        const notifications = [
            { title: '系统通知', content: '欢迎使用智慧农场小程序，祝您使用愉快！', time: '刚刚', type: 'system' },
            { title: '任务提醒', content: '您有3项待完成的任务需要处理', time: '10分钟前', type: 'task' },
            { title: '设备警报', content: '西区水稻田水泵1号运行异常，请及时检查', time: '30分钟前', type: 'alert' },
            { title: '环境预警', content: '预计明日有强降雨，请做好防汛准备', time: '1小时前', type: 'weather' },
            { title: '系统更新', content: '系统已更新至最新版本，新增设备远程控制功能', time: '昨天', type: 'system' }
        ];
        
        let notificationsHTML = '';
        notifications.forEach(notification => {
            let iconSVG = '';
            let bgColor = '';
            
            switch(notification.type) {
                case 'system':
                    iconSVG = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>';
                    bgColor = 'bg-blue-50';
                    break;
                case 'task':
                    iconSVG = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" /></svg>';
                    bgColor = 'bg-green-50';
                    break;
                case 'alert':
                    iconSVG = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>';
                    bgColor = 'bg-red-50';
                    break;
                case 'weather':
                    iconSVG = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-yellow-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z" /></svg>';
                    bgColor = 'bg-yellow-50';
                    break;
                default:
                    iconSVG = '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" /></svg>';
                    bgColor = 'bg-gray-50';
            }
            
            notificationsHTML += `
                <div class="notification-item ${bgColor} p-3 rounded-lg mb-3 animate__animated animate__fadeIn">
                    <div class="flex">
                        <div class="flex-shrink-0 mr-3">
                            ${iconSVG}
                        </div>
                        <div class="flex-1">
                            <div class="flex justify-between items-start">
                                <h3 class="font-medium">${notification.title}</h3>
                                <span class="text-xs text-gray-500">${notification.time}</span>
                            </div>
                            <p class="text-sm text-gray-600 mt-1">${notification.content}</p>
                        </div>
                    </div>
                </div>
            `;
        });
        
        panelBody.innerHTML = notificationsHTML || '<p class="text-center text-gray-500 py-4">暂无通知</p>';
        
        panelContent.appendChild(panelHeader);
        panelContent.appendChild(panelBody);
        notificationPanel.appendChild(panelContent);
        document.body.appendChild(notificationPanel);
        
        // 添加关闭按钮事件
        notificationPanel.querySelector('.close-panel-btn').addEventListener('click', function() {
            notificationPanel.classList.remove('translate-x-0');
            notificationPanel.classList.add('translate-x-full');
            
            // 延迟移除面板
            setTimeout(() => {
                if (notificationPanel.parentNode) {
                    notificationPanel.parentNode.removeChild(notificationPanel);
                }
            }, 300);
        });
    }
    
    // 显示面板
    setTimeout(() => {
        notificationPanel.classList.remove('translate-x-full');
        notificationPanel.classList.add('translate-x-0');
    }, 10);
    
    // 清除未读消息徽章
    clearNotificationBadge();
}

/**
 * 更新通知徽章
 */
function updateNotificationBadge(count) {
    const badges = document.querySelectorAll('.notification-badge');
    
    // 如果没有指定数量，则使用默认值或从localStorage获取
    if (count === undefined) {
        count = parseInt(localStorage.getItem('unreadNotifications') || '0');
    } else {
        // 保存到localStorage
        localStorage.setItem('unreadNotifications', count.toString());
    }
    
    badges.forEach(badge => {
        if (count > 0) {
            badge.textContent = count > 99 ? '99+' : count;
            badge.classList.remove('hidden');
        } else {
            badge.classList.add('hidden');
        }
    });
}

/**
 * 清除通知徽章
 */
function clearNotificationBadge() {
    updateNotificationBadge(0);
}

/**
 * 显示通知
 */
function showNotification(message, type = 'success', duration = 3000) {
    const container = document.getElementById('notification-container');
    
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.style.marginBottom = '0.5rem';
    
    // 设置通知类型样式
    if (type === 'success') {
        notification.style.backgroundColor = '#07c160';
    } else if (type === 'error') {
        notification.style.backgroundColor = '#ff3b30';
    } else if (type === 'warning') {
        notification.style.backgroundColor = '#ff9800';
    } else if (type === 'info') {
        notification.style.backgroundColor = '#007aff';
    }
    
    notification.innerHTML = `
        <div class="flex items-center">
            <div class="mr-2">
                ${type === 'success' ? '<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" /></svg>' : ''}
                ${type === 'error' ? '<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>' : ''}
                ${type === 'warning' ? '<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>' : ''}
                ${type === 'info' ? '<svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>' : ''}
            </div>
            <div>${message}</div>
        </div>
    `;
    
    container.appendChild(notification);
    
    // 添加显示动画
    setTimeout(() => {
        notification.classList.add('show');
    }, 10);
    
    // 设置自动关闭
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, duration);
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
                openModal(modal);
            }
        });
    });
    
    // 为所有模态框关闭按钮添加点击事件
    document.querySelectorAll('[data-modal-close]').forEach(closeBtn => {
        closeBtn.addEventListener('click', function() {
            const modal = this.closest('.modal');
            if (modal) {
                closeModal(modal);
            }
        });
    });
    
    // 点击模态框背景关闭模态框
    document.querySelectorAll('.modal').forEach(modal => {
        modal.addEventListener('click', function(event) {
            if (event.target === this) {
                closeModal(this);
            }
        });
    });
}

/**
 * 打开模态框
 */
function openModal(modal) {
    modal.classList.add('show');
    document.body.style.overflow = 'hidden'; // 防止背景滚动
}

/**
 * 关闭模态框
 */
function closeModal(modal) {
    modal.classList.remove('show');
    document.body.style.overflow = ''; // 恢复背景滚动
}

/**
 * 初始化设备控制面板
 */
function initDeviceControlPanel() {
    const deviceSwitches = document.querySelectorAll('.device-switch');
    
    deviceSwitches.forEach(switchEl => {
        switchEl.addEventListener('click', function() {
            const deviceId = this.getAttribute('data-device-id');
            const deviceName = this.getAttribute('data-device-name') || '设备';
            const currentStatus = this.getAttribute('data-status');
            const newStatus = currentStatus === 'on' ? 'off' : 'on';
            
            // 显示加载状态
            this.classList.add('processing');
            const switchKnob = this.querySelector('.switch-knob');
            if (switchKnob) {
                switchKnob.innerHTML = '<div class="loading-spinner-sm"></div>';
            }
            
            // 模拟API调用延迟
            setTimeout(() => {
                // 更新开关状态
                this.setAttribute('data-status', newStatus);
                this.classList.remove('processing');
                
                // 更新开关UI
                if (newStatus === 'on') {
                    this.classList.add('bg-green-500');
                    this.classList.remove('bg-gray-300');
                    if (switchKnob) {
                        switchKnob.innerHTML = '';
                    }
                } else {
                    this.classList.remove('bg-green-500');
                    this.classList.add('bg-gray-300');
                    if (switchKnob) {
                        switchKnob.innerHTML = '';
                    }
                }
                
                // 显示操作结果通知
                showNotification(`${deviceName}已${newStatus === 'on' ? '开启' : '关闭'}`, newStatus === 'on' ? 'success' : 'info');
                
                // 更新相关设备状态指示器
                const statusIndicators = document.querySelectorAll(`[data-status-for="${deviceId}"]`);
                statusIndicators.forEach(indicator => {
                    // 更新状态文本
                    if (indicator.tagName === 'SPAN' || indicator.tagName === 'DIV') {
                        indicator.textContent = newStatus === 'on' ? '运行中' : '已关闭';
                    }
                    
                    // 更新状态类
                    indicator.classList.remove('status-on', 'status-off');
                    indicator.classList.add(newStatus === 'on' ? 'status-on' : 'status-off');
                });
                
                // 这里可以添加API调用来控制实际设备
                console.log(`设备 ${deviceId} 状态已切换为 ${newStatus}`);
                
                // 如果是灌溉设备，更新相关土壤湿度显示
                if (deviceName.includes('灌溉') || deviceName.includes('水泵')) {
                    updateMoistureDisplay(deviceId, newStatus);
                }
            }, 800);
        });
    });
    
    // 初始化设备滑块控制
    const deviceSliders = document.querySelectorAll('input[type="range"][data-device-id]');
    deviceSliders.forEach(slider => {
        const valueDisplay = document.querySelector(`[data-value-display="${slider.getAttribute('data-device-id')}"]`);
        
        // 初始显示值
        if (valueDisplay) {
            valueDisplay.textContent = slider.value + (slider.getAttribute('data-unit') || '');
        }
        
        // 监听滑块变化
        slider.addEventListener('input', function() {
            if (valueDisplay) {
                valueDisplay.textContent = this.value + (this.getAttribute('data-unit') || '');
            }
        });
        
        // 监听滑块释放
        slider.addEventListener('change', function() {
            const deviceId = this.getAttribute('data-device-id');
            const deviceName = this.getAttribute('data-device-name') || '设备';
            const value = this.value;
            const unit = this.getAttribute('data-unit') || '';
            
            // 显示操作结果通知
            showNotification(`${deviceName}已设置为 ${value}${unit}`, 'success');
            
            // 这里可以添加API调用来控制实际设备
            console.log(`设备 ${deviceId} 值已设置为 ${value}${unit}`);
        });
    });
}

/**
 * 更新土壤湿度显示
 */
function updateMoistureDisplay(deviceId, status) {
    // 查找相关的土壤湿度显示元素
    const moistureDisplays = document.querySelectorAll('.moisture-display, .soil-moisture-value');
    
    if (moistureDisplays.length > 0 && status === 'on') {
        // 模拟灌溉开启后土壤湿度逐渐增加
        let currentInterval;
        let count = 0;
        
        currentInterval = setInterval(() => {
            moistureDisplays.forEach(display => {
                const currentValue = parseInt(display.textContent) || 0;
                if (currentValue < 85) {
                    const newValue = Math.min(currentValue + 5, 85);
                    display.textContent = newValue + '%';
                    
                    // 更新进度条（如果存在）
                    const progressBar = display.closest('.data-item')?.querySelector('.progress-value');
                    if (progressBar) {
                        progressBar.style.width = newValue + '%';
                        
                        // 更新颜色
                        progressBar.classList.remove('bg-red-500', 'bg-yellow-500', 'bg-green-500');
                        if (newValue < 30) {
                            progressBar.classList.add('bg-red-500');
                        } else if (newValue < 60) {
                            progressBar.classList.add('bg-yellow-500');
                        } else {
                            progressBar.classList.add('bg-green-500');
                        }
                    }
                }
            });
            
            count++;
            if (count >= 5) {
                clearInterval(currentInterval);
            }
        }, 1000);
    }
}

/**
 * 初始化图表
 */
function initCharts() {
    // 这里可以使用Chart.js或其他图表库来初始化图表
    // 由于没有引入图表库，这里只是一个示例框架
    console.log('图表初始化');
    
    // 模拟图表数据加载
    const chartContainers = document.querySelectorAll('.chart-container');
    chartContainers.forEach(container => {
        // 添加加载动画
        container.innerHTML = '<div class="flex items-center justify-center h-full"><div class="loading-spinner"></div></div>';
        
        // 模拟数据加载延迟
        setTimeout(() => {
            // 这里应该是实际的图表初始化代码
            container.innerHTML = '<div class="flex items-center justify-center h-full text-gray-500">图表已加载</div>';
        }, 1000);
    });
}

// 导出公共函数供其他脚本使用
window.appUtils = {
    showNotification,
    openModal,
    closeModal
};