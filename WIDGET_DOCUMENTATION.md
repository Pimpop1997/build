# 🎛️ TaskShark Navigation Widget Documentation

## Overview

The TaskShark Navigation Widget is an enhanced floating navigation component that provides quick access to main application features with advanced customization options.

## Features

### 🌐 Language Toggle

- **Bilingual Support**: Switch between English and Thai
- **Persistent Preference**: Language choice saved to localStorage
- **Real-time Translation**: Instant UI updates without page reload
- **Visual Indicator**: Shows current language in widget header

### ⚙️ Settings Panel

- **Theme Control**: Dark, Light, and Auto theme options
- **Position Control**: Left or right screen positioning
- **Notifications Toggle**: Enable/disable widget notifications
- **Persistent Settings**: All preferences saved locally

### 🎨 Customization Options

#### Themes

- **Dark Theme**: Default dark mode with green accents
- **Light Theme**: Clean light interface
- **Auto Theme**: Follows system preferences

#### Positioning

- **Right Side**: Default position on screen right
- **Left Side**: Alternative left-side positioning
- **Adaptive Panel**: Settings panel adjusts based on widget position

## Technical Implementation

### HTML Structure

```html
<div class="floating-widget" id="floatingWidget">
  <!-- Widget Header with Controls -->
  <div class="widget-header">
    <div class="widget-controls">
      <button class="widget-control-btn" onclick="toggleLanguage()">
        <i class="fas fa-globe"></i>
        <span id="currentLang">EN</span>
      </button>
      <button class="widget-control-btn" onclick="toggleSettings()">
        <i class="fas fa-cog"></i>
      </button>
    </div>
  </div>

  <!-- Main Widget Icon -->
  <div class="widget-icon" onclick="toggleWidget()">
    <i class="fas fa-rocket"></i>
  </div>

  <!-- Settings Panel -->
  <div class="widget-settings" id="widgetSettings">
    <!-- Settings content -->
  </div>

  <!-- Navigation Links -->
  <div class="widget-links" id="widgetLinks">
    <!-- Navigation items with bilingual support -->
  </div>
</div>
```

### CSS Classes

#### Main Widget

- `.floating-widget`: Main container with backdrop filter
- `.widget-header`: Control buttons container
- `.widget-icon`: Central navigation toggle button
- `.widget-links`: Navigation menu items

#### Controls

- `.widget-control-btn`: Settings and language toggle buttons
- `.widget-settings`: Expandable settings panel
- `.setting-item`: Individual setting controls

#### States

- `.show`: Display state for panels and menus
- `:hover`: Interactive hover effects
- `:focus`: Keyboard navigation support

### JavaScript Functions

#### Core Functions

```javascript
toggleWidget(); // Toggle main navigation menu
toggleLanguage(); // Switch between EN/TH languages
toggleSettings(); // Show/hide settings panel
changeTheme(); // Apply theme changes
changePosition(); // Update widget position
```

#### Utility Functions

```javascript
updateLanguage(); // Apply language changes to UI
saveLanguagePreference(); // Store language choice
loadSavedPreferences(); // Restore user settings
```

## Usage Examples

### Language Switching

```javascript
// Toggle language programmatically
toggleLanguage();

// Set specific language
currentLanguage = "th";
updateLanguage();
```

### Theme Management

```javascript
// Change theme programmatically
document.getElementById("themeSelect").value = "light";
changeTheme();
```

### Position Control

```javascript
// Move widget to left side
document.getElementById("positionSelect").value = "left";
changePosition();
```

## Data Attributes

### Bilingual Content

Elements with language support use data attributes:

```html
<span class="link-text" data-en="Chat" data-th="แชท">Chat</span>
```

### Translation Keys

- `data-en`: English text
- `data-th`: Thai text

## Local Storage Keys

### Preference Storage

- `widgetTheme`: Theme preference (dark/light/auto)
- `widgetPosition`: Position preference (left/right)
- `widgetLanguage`: Language preference (en/th)

## Accessibility Features

### Keyboard Support

- Tab navigation through controls
- Enter/Space activation for buttons
- Escape key to close panels

### Visual Indicators

- Hover states for all interactive elements
- Focus indicators for keyboard navigation
- Loading states and transitions

### Screen Reader Support

- Proper ARIA labels
- Semantic HTML structure
- Descriptive button titles

## Responsive Behavior

### Mobile Adaptations

- Touch-friendly button sizes (32px minimum)
- Appropriate spacing for finger taps
- Readable text sizes across devices

### Desktop Enhancements

- Hover effects and micro-interactions
- Keyboard shortcuts support
- Smooth animations and transitions

## Browser Compatibility

### Supported Features

- CSS Custom Properties (IE11+)
- LocalStorage API (IE8+)
- Font Awesome Icons (All modern browsers)
- Backdrop Filter (Modern browsers with fallback)

### Fallbacks

- Graceful degradation for older browsers
- Alternative styling when backdrop-filter unavailable
- JavaScript feature detection

---

## 🖼️ Post Feed Gallery (โพสต์ฟีดแบบมีแกลเลอรี่)

### Concept
- ฟีดแต่ละโพสต์แบ่ง 3 ส่วน: **หัวโพสต์**, **แกลเลอรี่ภาพ (สูงสุด 4 รูป)**, **คำอธิบาย/ลิงก์ใต้ภาพ**
- ใช้ร่วมกับ React/Next.js หรือ static HTML ได้
- รองรับธีมเข้ม/ฟ้า และ responsive

### โครงสร้างข้อมูล (mock data ตัวอย่าง)
```js
{
  id: "demo1",
  title: "หัวข้อโพสต์",
  images: [
    "https://placekitten.com/800/400",
    "https://placebear.com/800/400",
    "https://picsum.photos/id/1015/800/400",
    "https://picsum.photos/id/1035/800/400"
  ],
  description: "คำอธิบายใต้ภาพ",
  link: "https://example.com",
  created_at: "2025-06-26T17:00:00+07:00",
  user: { display_name: "SharkDev", avatar_url: "" }
}
```

- `title`: ชื่อโพสต์/หัวข้อ
- `images`: array ของ url (สูงสุด 4 รูป)
- `description`: คำอธิบายใต้ภาพ (optional)
- `link`: ลิงก์ใต้ภาพ (optional)

### ตัวอย่างการใช้งานใน React/Next.js
```tsx
<div id="feed">
  <ActivityFeed />
</div>
```

**ในแต่ละโพสต์ (ActivityCard):**
- ส่วนหัว: `{activity.title}`
- แกลเลอรี่: `{activity.images.slice(0,4).map(...)} `
- คำอธิบาย/ลิงก์: `{activity.description}` `{activity.link}`

### CSS ที่เกี่ยวข้อง (src/app/post-feed-gallery.css)
```css
.scroll-wrapper {
  display: flex;
  overflow-x: auto;
  gap: 12px;
  scroll-snap-type: x mandatory;
  padding: 10px 0;
  border-radius: 10px;
}
.scroll-wrapper::-webkit-scrollbar { height: 8px; }
.scroll-wrapper::-webkit-scrollbar-thumb { background: #39f8; border-radius: 4px; }
.scroll-wrapper::-webkit-scrollbar-track { background: #222; }
.post-image {
  flex-shrink: 0;
  width: 440px;
  height: 240px;
  object-fit: cover;
  border-radius: 12px;
  scroll-snap-align: center;
  border: 4px solid #39f;
  box-shadow: 0 0 8px #39f7;
  background: #222;
  transition: transform 0.2s;
}
.post-image:hover {
  transform: scale(1.025);
  box-shadow: 0 0 20px #39f;
}
```

### Integration Notes
- **Static hosting:** `/feed` จะ 404 ถ้าไม่มีไฟล์/route จริง ให้ใช้ `/#feed` (hash) เพื่อเลื่อนหน้าไปยัง element ที่มี id="feed"
- **Next.js dev:** ใช้ `npm run dev` หรือ `next dev` เพื่อรองรับ dynamic route
- **Builder.io:** ตรวจสอบ path import CSS และการ mapping field ให้ตรงกับ UI
- **Mock data:** ต้องใส่ property `title`, `images`, `description`, `link` ให้ตรงกับที่ UI ใช้

---

## Customization Guide

### Adding New Languages

1. Add data attributes to HTML elements
2. Update translation object in JavaScript
3. Add language option to toggle function

### Theme Extensions

1. Define CSS custom properties
2. Add theme option to select element
3. Implement theme logic in changeTheme()

### New Settings

1. Add setting item to HTML
2. Create corresponding JavaScript function
3. Implement localStorage persistence

## Performance Considerations

### Optimization Techniques

- CSS transitions instead of JavaScript animations
- Event delegation for dynamic content
- Debounced resize handlers
- Minimal DOM queries

### Loading Strategy

- Progressive enhancement
- Lazy loading of non-critical features
- Efficient event handling

## Future Enhancements

### Planned Features

- More language options
- Custom color themes
- Drag-and-drop positioning
- Keyboard shortcuts configuration
- Integration with TaskShark settings

### API Integration

- Sync settings with user account
- Cloud preference storage
- Multi-device synchronization

## Troubleshooting

### Common Issues

1. **Settings not persisting**: Check localStorage availability
2. **Theme not applying**: Verify CSS custom property support
3. **Language not switching**: Ensure data attributes are present

### Debug Mode

Enable widget debugging by setting:

```javascript
window.widgetDebug = true;
```

## Version History

### v1.1.0 (Current)

- Added bilingual support (EN/TH)
- Implemented settings panel
- Added theme switching
- Position customization
- Persistent preferences

### v1.0.0 (Base)

- Basic floating widget
- Navigation menu
- Hover effects
- Mobile responsive design

---

**Last Updated**: December 26, 2024
**Version**: 1.1.0
**Maintainer**: TaskShark Development Team

---

> **หมายเหตุ:**
> กรุณาตรวจสอบให้แน่ใจว่า widget ที่ production มีฟีเจอร์ครบถ้วนตรงกับเอกสารนี้ (bilingual, adaptive, notification toggle, real-time translation ฯลฯ) หากมีฟีเจอร์ใดขาดหายหรือแตกต่าง กรุณาอัปเดตเอกสารหรือ widget ให้ตรงกัน
