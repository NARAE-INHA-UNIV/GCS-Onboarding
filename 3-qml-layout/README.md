# 3. QML Layout - 레이아웃 시스템 이해하기

QML의 레이아웃 시스템과 정렬 방법을 배우는 예제입니다.

## 📚 학습 목표

- RowLayout과 ColumnLayout의 차이 이해하기
- Layout.\* 속성 사용법 배우기
- anchors.\* 속성 사용법 배우기
- Layout vs anchors 차이점과 사용 시나리오 이해하기

## 🚀 실행 방법

```bash
cd 3-qml-layout
python main.py
```

## 📖 레이아웃 개념

### 1. RowLayout vs ColumnLayout

#### ColumnLayout (수직 배치)

```qml
ColumnLayout {
    spacing: 10
    Rectangle { width: 100; height: 50 }
    Rectangle { width: 100; height: 50 }
    Rectangle { width: 100; height: 50 }
}
```

- 자식 요소들을 **위에서 아래로** 배치

#### RowLayout (수평 배치)

```qml
RowLayout {
    spacing: 10
    Rectangle { width: 100; height: 50 }
    Rectangle { width: 100; height: 50 }
    Rectangle { width: 100; height: 50 }
}
```

- 자식 요소들을 **왼쪽에서 오른쪽으로** 배치

### 2. Layout.\* 속성 (레이아웃 내부에서 사용)

Layout.\* 속성은 **레이아웃 내부에서만** 동작합니다.

#### 주요 속성

| 속성                     | 설명                                                      |
| ------------------------ | --------------------------------------------------------- |
| `Layout.fillWidth`       | 가능한 모든 가로 공간 차지                                |
| `Layout.fillHeight`      | 가능한 모든 세로 공간 차지                                |
| `Layout.preferredWidth`  | 선호하는 너비 지정                                        |
| `Layout.preferredHeight` | 선호하는 높이 지정                                        |
| `Layout.minimumWidth`    | 최소 너비                                                 |
| `Layout.maximumWidth`    | 최대 너비                                                 |
| `Layout.alignment`       | 레이아웃 내 정렬 (AlignLeft, AlignHCenter, AlignRight 등) |
| `Layout.margins`         | 여백 설정                                                 |

#### 사용 예제

```qml
RowLayout {
    Rectangle {
        Layout.fillWidth: true  // 남은 공간 모두 차지
        Layout.preferredHeight: 50
    }
    Rectangle {
        Layout.preferredWidth: 100  // 고정 너비
        Layout.preferredHeight: 50
    }
}
```

```qml
ColumnLayout {
    Rectangle {
        Layout.alignment: Qt.AlignHCenter  // 수평 중앙 정렬
        Layout.preferredWidth: 200
        Layout.preferredHeight: 50
    }
}
```

### 3. anchors 속성 (레이아웃 외부에서 사용)

anchors는 **부모나 형제 요소를 기준**으로 위치를 지정합니다.

#### 주요 속성

| 속성                       | 설명                |
| -------------------------- | ------------------- |
| `anchors.top`              | 상단 기준           |
| `anchors.bottom`           | 하단 기준           |
| `anchors.left`             | 왼쪽 기준           |
| `anchors.right`            | 오른쪽 기준         |
| `anchors.centerIn`         | 부모 중앙에 배치    |
| `anchors.fill`             | 부모 전체 공간 차지 |
| `anchors.margins`          | 여백 설정           |
| `anchors.horizontalCenter` | 수평 중앙 기준      |
| `anchors.verticalCenter`   | 수직 중앙 기준      |

#### 사용 예제

```qml
Rectangle {
    anchors.fill: parent  // 부모 전체 크기
    anchors.margins: 10
}
```

```qml
Rectangle {
    anchors.centerIn: parent  // 부모 중앙에 배치
    width: 100
    height: 100
}
```

```qml
Rectangle {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.margins: 20
}
```

## 🔍 Layout vs anchors 비교

| 특성        | Layout.\*               | anchors               |
| ----------- | ----------------------- | --------------------- |
| 사용 위치   | 레이아웃 **내부**에서만 | 어디서나              |
| 배치 방식   | 자동 배치               | 수동 배치             |
| 정렬        | `Layout.alignment`      | `anchors.centerIn` 등 |
| 반응형      | 쉬움                    | 직접 구현             |
| 적합한 사례 | 리스트, 폼, 툴바        | 오버레이, 고정 위치   |

### Layout.\* 사용 시나리오

- ✅ 여러 요소를 자동으로 배치할 때
- ✅ 반응형 UI가 필요할 때
- ✅ 요소들이 동적으로 추가/제거될 때
- ✅ 간단하고 구조적인 배치

```qml
// 추천: 버튼들을 수평으로 나열
RowLayout {
    Button { text: "저장" }
    Button { text: "취소" }
    Button { text: "적용" }
}
```

### anchors 사용 시나리오

- ✅ 특정 위치에 고정해야 할 때
- ✅ 부모나 형제 요소 기준으로 배치할 때
- ✅ 겹치는(overlay) UI 요소
- ✅ 정밀한 위치 제어가 필요할 때

```qml
// 추천: 오버레이 알림 메시지
Rectangle {
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.margins: 20
    width: 300
    height: 80
}
```

### ⚠️ 주의사항

**Layout과 anchors를 함께 사용하면 안 됩니다!**

```qml
// ❌ 잘못된 예 - 충돌 발생!
ColumnLayout {
    Rectangle {
        Layout.fillWidth: true
        anchors.centerIn: parent  // 충돌!
    }
}
```

```qml
// ✅ 올바른 예 - 하나만 선택
ColumnLayout {
    Rectangle {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter  // Layout 정렬 사용
    }
}
```

## 🎯 다음 단계

1. RowLayout을 꽉 채우는 동일한 크기의 버튼 3개 만들기
2. anchors를 사용하여 부모의 네 모서리에 작은 사각형 배치하기
3. Layout과 anchors를 혼용했을 때 어떤 일이 발생하는지 테스트해보기

## 💡 참고 자료

- [Qt Quick Layouts](https://doc.qt.io/qt-6/qtquicklayouts-index.html)
- [Positioning with Anchors](https://doc.qt.io/qt-6/qtquick-positioning-anchors.html)
- [Layout QML Type](https://doc.qt.io/qt-6/qml-qtquick-layouts-layout.html)
