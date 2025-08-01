<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />

 </head>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<ul class="step">
				<li class="on"><span>1</span>서비스 이용약관</li>
				<li><span>2</span></li>
				<li><span>3</span></li>

			</ul>
			<ul class="mem">
				<li>
					<p>개인정보 수집 및 이용 동의 <span>(필수)</span></p>
					<div>
						<div class="mem_agree userPriv">
							<p class="prv_tit">수집하는 개인정보의 항목</p>
							<p class="prv_sub">서비스 제공을 위해, 회원가입 시점에 아래에 해당하는 개인정보를 수집합니다.</p>
							<ul class="prv_list">
								<li>
									1. 이메일, 이름, 광고성 정보 수신 동의 여부, 타 서비스 로그인 고유번호, 연계정보(CI, DI)
									<span>※각 항목 또는 추가적으로 수집이 필요한 개인정보 및 개인정보를 포함한 자료는 이용자 응대 과정과 서비스 내부 알림 수단 등을 통해 별도로 요청수집 될 수 있습니다.</span>
									<span>※ 서비스 이용 과정에서 기기 정보, 이용 기록, 로그 기록이 자동으로 수집될 수 있습니다.</span>
								</li>
							</ul>

							<p class="prv_tit">수집한 개인정보의 이용</p>
							<p class="prv_sub">회원가입 시점에 수집된 개인정보는 아래의 목적에 한해 이용됩니다.</p>
							<ul class="prv_list">
								<li>1. 가입 및 탈퇴 의사 확인, 회원 식별 등 회원 관리</li>
								<li>2. 서비스 제공 및 기존·신규 시스템 개발유지·개선</li>
								<li>3. 불법·약관 위반 게시물 게시 등 부정행위 방지를 위한 운영 시스템 개발유지 개선</li>
								<li>4. 인구통계학적 자료 분석을 통한 맞춤형 콘텐츠 및 광고 제공</li>
							</ul>

							<p class="prv_tit">수집한 개인정보의 보관 및 파기</p>
							<p class="prv_sub">회사는 서비스를 제공하는 동안 개인정보 취급방침 및 관련법에 의거하여 회원의 개인정보를 지속적으로 관리 및 보관합니다. 탈퇴 등으로 인해 개인정보 수집 및 이용목적이 달성될 경우, 수집 된 개인정보는 즉시 또는 아래와 같이 일정 기간 이후 파기됩니다.</p>
							<ul class="prv_list">
								<li>1. 가입 시 수집된 개인정보 : 탈퇴 후 14일</li>
								<li>2. 로그기록 : 최대 3년
									<span>※ 위 항에도 불구하고 법령에 의해 개인정보를 보관할 경우, 해당 법령에서 정한 최대 기간만큼 저장합니다.</span>
									<span>※ 개인정보의 수집 및 이용 목적이 달성되지 않았을 경우, 개인정보 파기 요청은 처리되지 않습니다.</span>
									<span>※ 개인정보 파기는 복구가 불가능한 기술적 방법을 이용하므로, 파기된 개인정보를 복원 할 수 없습니다.</span>
									<span>※ 회원이 1년 이상 로그인 및 접속을 하지 않을 경우, 해당 계정은 휴면 계정으로 전환됩니다. 개인정보의 안전한 처리를 위해 휴면 계정의 학교, 아이디, 이메일, 이름, 닉네임, 입학 년도, 연계정보는 분리 보관되며, 이외의 개인정보 및 이용기록은 모두 파기될 수 있습니다.<br/>
									휴면 계정이 로그인에 성공할 경우, 휴면 상태가 즉시 해제되어 모든 서비스를 이용할 수 있습니다. 휴면 계정 전환 이후에도 3년 간 로그인을 하지 않을 경우, 해당 계정은 영구 삭제됩니다.</span>
								<li>
							</ul>

							<p class="prv_tit">개인정보의 제3자 제공 및 처리위탁</p>
							<p class="prv_sub">회사는 관련법 및 회원의 동의가 없는 한, 회원의 개인정보를 제3자에게 절대 제공하지 않습니다. 단, 회사는 보안성 높은 서비스 제공을 위하여, 신뢰도가 검증된 아래 회사에 개인정보 관련 업무 처리를 위탁할 수 있습니다.<br/><br/>
							이 경우 회사는 회원에게 위 탁을 받는 자와 업무의 내용을 사전에 알리고 동의를 받습니다. 위탁을 받는 자 또는 업무의 내용이 변경될 경우에도 같습니다. 회사는 정보통신서비스의 제공에 관한 계약을 이행하고 회원의 편의 증진 등 을 위하여 추가적인 처리 위탁이 필요한 경우에는 고지 및 동의 절차를 거치 지 않을 수 있습니다.</p>
						
						</div>
						<p><input type="checkbox" name="ag01" id="ag01" onclick='checkSelectAll(this)'/><label for="ag01">동의합니다</label></p>
					</div>
				</li>
				<li>
					<p>금지 행위 <span>(필수)</span></p>
					<div>
						<div class="mem_agree userPriv">
							<p class="prv_tit">금지 행위</p>
							<p class="prv_sub tt">1. 국제 평화, 국제 질서 및 국가 간의 우의를 현저히 해할 우려가 있는 행위</p>
							<ul class="prv_list">
								<li>- 인종차별∙테러 등 국제 평화 및 국제질서를 현저히 해할 우려가 있는 행위</li>
								<li>- 외국의 국기∙국장 등을 모독함으로써 국익에 반하거나 국가 간의 우의를 현저히 해할 우려가 있는 행위</li>
								<li>- 그 밖에 외국의 정치∙종교∙문화∙사회에 대한 비방∙비하∙멸시 등 국가 간의 우의를 현저히 해할 우려가 있는 행위</li>
							</ul>
							<p class="prv_sub tt top">2. 헌법에 위배되거나 국가의 존립을 해하는 행위</p>
							<ul class="prv_list">
								<li>- 국가의 존립∙안전이나 자유민주적 기본질서를 현저히 위태롭게 할 우려가 있는 행위</li>
								<li>- 헌법을 부정하거나 국가기관을 마비시킬 우려가 현저한 행위</li>
								<li>- 법령에 따라 분류된 비밀 등 국가기밀을 누설하는 행위</li>
								<li>- 「국가보안법」에서 금지하는 행위를 수행하는 행위</li>
								<li>- 헌법에 반하여 역사적 사실을 현저히 왜곡하는 행위</li>
							</ul>
							<p class="prv_sub tt top">3. 범죄 기타 법령에 위반되는 행위</p>
							<ul class="prv_list">
								<li>- 범죄를 목적으로 하거나 예비∙음모∙교사∙방조할 우려가 현저한 행위</li>
								<li>- 범죄의 수단이나 방법 또는 범죄에 이르는 과정이나 결과를 구체적으로 묘사하여 범죄를 조장할 우려가 있는 행위</li>
								<li>- 범죄, 범죄인 또는 범죄단체 등을 미화하여 범죄를 정당하다고 보이게 할 우려가 있는 행위</li>
								<li>- 그 밖에 범죄 및 법령에 위반되는 위법행위를 조장하여 건전한 법질서를 현저히 해할 우려가 있는 행위</li>
							</ul>
							<p class="prv_sub tt top">4. 사회통념상 일반인의 성욕을 자극하여 성적 흥분을 유발하고 정상적인 성적 수치심을 해하여 성적 도의관념에 반하는 행위</p>
							<ul class="prv_list">
								<li>- 신체 분위 또는 성적 행위를 노골적으로 표현 또는 묘사하는 행위</li>
								<li>- 자극적이고 혐오스런 성적표현 및 남녀 신체에 관한 은어 및 비속어를 사용하여 성행위를 구체적으로 묘사하는 행위</li>
								<li>- 성폭력행위를 노골적으로 묘사하는 행위</li>
								<li>- 신체의 일부 또는 도구를 이용한 유사성교행위를 노골적으로 묘사하는 행위</li>
								<li>- 자위행위 및 전희를 구체적으로 묘사하는 행위</li>
								<li>- 수간, 시간, 혼음, 근친상간, 가학성∙피학성 음란증, 관음증 등 비정상적인 행위를 구첵적으로 묘사한 행위</li>
								<li>- 아동 또는 청소년을 성적 유희의 대상으로 직접적이고 구체적으로 묘사한 행위</li>
								<li>- 불건전한 모임, 대화, 통화 등 온∙오프라인 만남 행위</li>
								<li>- 유흥 관련 정보 공유, 매매∙알선 행위 등 불법 행위</li>
								<li>- 그 밖에 일반인의 성적 수치심을 현저히 해할 우려가 있는 행위</li>
							</ul>
							<p class="prv_sub tt top">5. 폭력성∙잔혹성∙혐오성 등이 심각한 행위</p>
							<ul class="prv_list">
								<li>- 장애인, 노인, 임산부, 아동 등 사회적인 약자 또는 부모, 스승 등에 대한 살상, 폭행, 협박, 학대행위 등을 구체적으로 묘사하는 행위</li>
								<li>- 오물, 신체 분비물 등을 구체적∙사실적으로 묘사하여 혐오감을 불러일으키는 행위</li>
								<li>- 수술 장면 등 의료행위를 지나치게 상세히 표현하여 혐오감을 불러일으키는 행위</li>
								<li>- 흉기 그 밖의 위험한 물건 등을 사용하여 과도하게 신체 또는 시체를 손상하는 등 생명을 경시하는 잔혹한 행위</li>
								<li>- 동물에 대한 학대, 사체, 포식 등을 구체적으로 표현하여 잔혹감 또는 혐오감을 주는 행위</li>
								<li>- 과도한 욕설 등 저속한 언어 등을 사용하여 혐오감 또는 불쾌감을 주는 행위</li>
								<li>- 그 밖에 사람 또는 동물 등에 대한 육체적∙정신적 고통 등을 사실적∙구체적으로 표현하여 잔혹 또는 혐오감을 주는 행위</li>
							</ul>
							<p class="prv_sub tt top">6. 사회통합 및 사회질서는 저해하는 행위</p>
							<ul class="prv_list">
								<li>- 도박 등 사행심을 조장하는 행위</li>
								<li>- 미신숭배 등 비과학적인 생활태도를 조장하거나 정당화하는 행위</li>
								<li>- 특정 종교, 종파 또는 종교의식을 비방, 왜곡하거나 교리를 설파 및 전도, 포교하는 행위</li>
								<li>- 장애인, 노약자 등 사회적인 소외계층을 비하하는 행위</li>
								<li>- 학교교육 등 교육을 왜곡하여 현저히 교육기풍을 해하는 행위</li>
								<li>- 합리적 이유없이 성별, 종교, 장애, 나이, 사회적 신분, 출신, 인종, 지역, 직업 등을 차별하거나 이에 대한 편견을 조장하는 행위</li>
								<li>- 자살을 목적으로 하거나 이를 미화, 방조 또는 권유하여 자살 충동을 일으킬 우려가 있는 행위</li>
								<li>- 정당한 사유 없이 정보통신시스템, 데이터 또는 프로그램 등을 훼손∙멸실∙변경∙위조하거나 그 운용을 방해하는 내용의 행위</li>
								<li>- 「청소년 보호법」에 따른 청소년유해매체물로서 상대방의 연령 확인, 표시의무 등 법령에 따른 의무를 이행하지 아니하고 영리를 목적으로 제공하는 내용의 행위</li>
							</ul>
							<p class="prv_sub tt top">7. 타인의 권리를 침해하는 행위</p>
							<ul class="prv_list">
								<li>- 다른 이용자에게 불쾌감이나 불편함을 주는 행위</li>
								<li>- 개인정보 유포 등 사생활의 비밀과 자유를 침해할 우려가 현저한 행위</li>
								<li>- 정당한 권한 없이 타인의 사진, 영상 등을 게재하여 타인의 인격권을 현저히 침해하는 행위</li>
								<li>- 사람을 비방할 목적으로 공공연하게 타인을 모욕하거나 사실 또는 거짓의 사실을 드러내어 타인의 명예를 훼손하는 행위</li>
								<li>- 공포심이나 불안감을 유발하는 부호∙문언∙음향∙화상 또는 영상을 반복적으로 상대방에게 도달하도록 하는 행위</li>
								<li>- 정당한 권한없이 타인의 상표 또는 저작물 등을 사용, 실시 또는 매개하는 등 특허권, 상표권, 디자인권, 저작권 등 지적재산권을 침해하는 행위</li>
								<li>- 내용∙결말을 발설하거나, 혐오를 불러일으키거나, 속이거나, 놀라게 하는 행위</li>
								<li>- 그 밖에 정당한 권한없이 타인의 권리를 침해하는 행위</li>
							</ul>
							<p class="prv_sub tt top">8. 정치∙사회 관련 행위</p>
							<ul class="prv_list">
								<li>- 언론∙시민단체 등 관련 단체 옹호, 추천, 반대, 비하 행위</li>
								<li>- 특정 정당∙후보에 대한 지지, 비방, 투표 독려 행위</li>
								<li>- 다른 이용자를 특정 정치 단체 관련자 및 특정 이념 옹호자로 몰아가는 행위</li>
								<li>- 다양한 의견을 배척하고 여론을 하나로 수렴하는 행위</li>
								<li>- 다른 이용자나 게시물에 대한 욕설, 비난, 비꼬는 행위</li>
								<li>- 기타 정치∙사회 관련 갈등을 조장할 수 있는 행위 일체</li>
								<li>- 국가기관(정부∙공무원), 정치 관련 단체(정치인∙정당∙시민단체), 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위</li>
								<li>- 정책∙외교 또는 정치∙정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위</li>
								<li>- 성별, 종교, 인종, 출신, 지역, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위</li>
								<li>- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위</li>
							</ul>
							<p class="prv_sub tt top">9. 홍보 및 판매 행위</p>
							<ul class="prv_list">
								<li>- 비영리 목적의 강연∙행사, 개인 간 아르바이트∙과외 소개, 주변상권 소개, 학업 목적의 설문조사 이외의 게시물 작성 행위</li>
								<li>- 외부 단체∙법인∙기관∙사업체에서 운영하거나 소속된 동아리 홍보</li>
								<li>- 기관정치인정당종교단체와 직간접적으로 연관되거나, 관련한 활동을 하는 동아리 홍보</li>
								<li>- 청소년이 아닌 회원을 모집하는 동아리 홍보</li>
								<li>- 인력 모집을 위한 구인∙구직 목적의 동아리 홍보</li>
								<li>- 만남∙소개팅 형식의 동아리 홍보</li>
								<li>- 영리 여부와 관계 없이 사업체∙기관∙단체∙개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위</li>
								<li>- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭∙단어 언급 행위</li>
								<li class="pp">- 홍보 금지 행위 예시
									<span>· 공모전, 대외활동, 서포터즈, 이벤트, 아카데미, 공연, 영화 홍보</span>
									<span>· 교육, 의료, 식당, 부동산, 배달, 공유 사업 홍보</span>
									<span>· 어플리케이션, 웹사이트, SNS, 블로그, 카페, 스토어, 서비스 홍보</span>
									<span>· 채팅, 사진 교환, 동호회, 소개팅, 만남, 주선 홍보</span>
									<span>· 구독, 좋아요, 학우 참여, 모집, 링크 클릭, 추천인 입력, 앱 설치, 설문조사, 회원가입 요청</span>
									<span>· 공동구매, 펀딩, 기부금품 요청</span>
									<span>· 계정 공유 및 판매 요청, 홍보소개 요청, 바이럴 이벤트 등 게시물 대리 작성</span>
									<span>· 기타 홍보∙판매 관련 게시물 일체</span>
								</li>
							</ul>
							<p class="prv_sub tt top">10. 자살예방법에 반하는 자살 및 자해 유발정보 유통 행위</p>
							<ul class="prv_list">
								<li>- 자살 및 자해 동반자 모집 정보</li>
								<li>- 자살 및 자해를 실행하거나 유도하는 내용을 담은 문서, 사진 또는 동영상 등의 정보</li>
								<li>- 자살위해물건의 판매 또는 활용에 관한 정보</li>
								<li>- 기타 명백히 자살 및 자해 유발을 목적으로 하는 정보</li>
							</ul>
							<p class="prv_sub tt top">11. 의료법∙약사법∙관세법∙전파법∙외국환거래법 등 법률에 반하는 거래 불가능 품목 거래 행위</p>
							<ul class="prv_list">
								<li>- 주류, 담배, 마약류</li>
								<li>- 안경, 콘택트렌즈, 의약품, 헌혈증, 건강기능식품, 의료기기</li>
								<li>- 이미테이션 제품, 저작물 복사본</li>
								<li>- 청소년유해매체물</li>
								<li>- 2000불 이상의 달러/외화</li>
								<li>- 암표 등 수익 목적의 재판매 행위</li>
								<li>- 그 외 관련법에 의해 거래가 금지되거나, 온라인 상 거래가 금지된 물품</li>
							</ul>
							<p class="prv_sub tt top">12. 비정상적 서비스 이용 행위</p>
							<ul class="prv_list">
								<li>- 오류를 발생시키는 특수문자, 제목 및 내용 없는 글 등 비정상적 게시물 작성 행위</li>
								<li>- 동일한 주제의 게시물을 하나 이상의 커뮤니티에 반복적으로 게시하는 행위</li>
								<li>- 커뮤니티 유출, 시스템 해킹, 게시물 크롤링 등 서비스에 악영향을 주는 행위</li>
								<li>- 해당 지역 또는 학교의 학생이 아닌 이용자의 게시물 작성 행위</li>
								<li>- 시험정보, 평가, 급식 리뷰 등 서비스 내 비정상적 정보 기재 행위</li>
							</ul>
							<p class="prv_sub tt top">13. 악용 행위</p>
							<ul class="prv_list">
								<li>- 익명을 이용한 여론 조작 행위</li>
								<li>- 운영자 또는 이에 준하는 자격을 사칭하여 권한을 행사하는 행위</li>
								<li>- 내용 없는 외부 링크 게시, 외부 서비스 이용 강제유도 등 서비스 이탈 유도 행위</li>
							</ul>
							<p class="prv_sub tt top">14. 기타</p>
							<ul class="prv_list">
								<li>- 게시판/커뮤니티의 주제나 규칙에 어긋나는 게시물 작성 행위</li>
								<li>- 위 행위를 간접적으로 또는 유추 가능하도록 행하는 행위</li>
								<li>- 타인으로 하여금 위 행위를 행하도록 간접적으로 돕거나 독려하는 행위</li>
								<li>- 기타 위 행위와 비슷한 목적을 달성하기 위한 행위 일체</li>
							</ul>
							
							<p class="prv_tit">게시물 작성∙수정∙삭제 규칙</p>
							<p class="prv_sub">1. 불법촬영물 등을 유통할 경우 전기통신사업법 제22조의5제1항에 따른 삭제, 접근 제한 등 유통방지에 필요한 조치가 취해지며, 관련 법률에 따라 처벌을 받을 수 있습니다.<p>
							<p class="prv_sub top">2. 불법촬영물, 허위영상물, 아동∙청소년 성착취물 등 불법촬영물로 의심되는 게시물을 발견하셨을 경우, 유해정보신고센터에 신고해주시기 바랍니다.</p>
						</div>
						<p><input type="checkbox" name="ag02" id="ag02" onclick='checkSelectAll(this)'/><label for="ag02">동의합니다</label></p>
					</div>
				</li>
			</ul>
			<p class="all_check"><input type="checkbox" name="selectall" id="ag_all" onclick='selectAll(this)'/><label for="ag_all">모두 동의합니다</label></p>
			<p class="user_btn" style="background-color: #2e2fbf"><a href="javascript:fn_submit();">다음</a></p>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js">

function checkSelectAll(checkbox)  {
  const selectall 
    = document.querySelector('input[name="selectall"]');
  
  if(checkbox.checked === false)  {
    selectall.checked = false;
  }
}

function selectAll(selectAll)  {
  const checkboxes1
       = document.getElementsByName('ag01');
  checkboxes1.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
  const checkboxes2
       = document.getElementsByName('ag02');
  checkboxes2.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

function fn_submit(){
    if($('input[name="ag01"]:checkbox:checked').length < 1){
		alert("개인정보 수집 및 이용 동의가 필요합니다.");
		return false;
	}
	if($('input[name="ag02"]:checkbox:checked').length < 1){
		alert("금지 행위 및 이용 규칙에 대한 동의가 필요합니다.");
		return false;
	}
	
	location.href='join02.jsp';
}
</script>
</html>
