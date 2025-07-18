// 문서가 준비되면 이벤트 리스너를 추가합니다.
  document.addEventListener("DOMContentLoaded", function() {
    // 'cbtn' 클래스를 가진 모든 a 태그를 선택합니다.
    var closeButtons = document.querySelectorAll('a.cbtn_pop');

    // 각 버튼에 대해 클릭 이벤트 리스너를 추가합니다.
    closeButtons.forEach(function(button) {
      button.addEventListener('click', function(e) {
        e.preventDefault();  // 기본 이벤트를 방지합니다.
        window.close();      // 현재 창을 닫습니다.
      });
    });
  });