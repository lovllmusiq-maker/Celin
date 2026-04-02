import { useState, useRef, useEffect, createContext, useContext } from “react”;

// ─── LANGUAGES & TRANSLATIONS ────────────────────────────────────
const LANGS = [
{code:“en”,label:“English”,flag:“🇺🇸”,dir:“ltr”},
{code:“fr”,label:“Français”,flag:“🇫🇷”,dir:“ltr”},
{code:“es”,label:“Español”,flag:“🇪🇸”,dir:“ltr”},
{code:“ar”,label:“العربية”,flag:“🇸🇦”,dir:“rtl”},
{code:“pt”,label:“Português”,flag:“🇧🇷”,dir:“ltr”},
{code:“de”,label:“Deutsch”,flag:“🇩🇪”,dir:“ltr”},
{code:“zh”,label:“中文”,flag:“🇨🇳”,dir:“ltr”},
{code:“wo”,label:“Wolof”,flag:“🇸🇳”,dir:“ltr”},
{code:“ha”,label:“Hausa”,flag:“🇳🇬”,dir:“ltr”},
{code:“sw”,label:“Kiswahili”,flag:“🇰🇪”,dir:“ltr”},
{code:“it”,label:“Italiano”,flag:“🇮🇹”,dir:“ltr”},
{code:“ru”,label:“Русский”,flag:“🇷🇺”,dir:“ltr”},
{code:“ja”,label:“日本語”,flag:“🇯🇵”,dir:“ltr”},
{code:“ko”,label:“한국어”,flag:“🇰🇷”,dir:“ltr”},
{code:“hi”,label:“हिन्दी”,flag:“🇮🇳”,dir:“ltr”},
{code:“tr”,label:“Türkçe”,flag:“🇹🇷”,dir:“ltr”},
];

const T = {
en:{
appTagline:“Your intelligent savings platform.\nSecure, professional, and built for growth.”,
openAccount:“Open an Account”, signIn:“Sign In”, welcomeTo:“Welcome to”,
bankGrade:“Bank-grade\nSecurity”, aiPowered:“AI-powered\nAdvice”, globalCurr:“8+ Global\nCurrencies”,
personalInfo:“Personal Information”, provideDetails:“Please provide your details to get started.”,
fullName:“Full Name”, emailAddress:“Email Address”, phone:“Phone”,
password:“Password”, passwordMin:“Minimum 6 characters”, confirmPassword:“Confirm Password”, reEnter:“Re-enter your password”,
hide:“Hide”, show:“Show”, continue:“Continue →”,
alreadyAccount:“Already have an account?”, noAccount:“New to Pro.G?”,
setPin:“Set Your PIN”, choosePIN:“Choose a 4-digit PIN to secure your account access.”,
yourPin:“Your PIN”, confirmPin:“Confirm PIN”,
verifyEmail:“Verify Your Email”, codeSentTo:“A 6-digit code was sent to”,
simulated:“Simulated — your code appears in the notification above.”,
verificationCode:“Verification Code”, createAccount:“Create Account”, creating:“Creating your account…”,
resendCode:“Resend code”, signingIn:“Signing in…”,
welcomeBack:“Welcome back. Please enter your credentials.”,
forgotPassword:“Forgot password?”, resetPassword:“Reset Password”,
enterEmailReset:“Enter your email and we’ll send you a secure reset link.”,
sendResetLink:“Send Reset Link”, sending:“Sending…”, checkInbox:“Check Your Inbox”,
resetLinkSent:“A reset link has been sent to”, backToSignIn:“Back to Sign In”,
goodDay:“Good day,”, totalSavings:“Total Savings Portfolio”, funded:“FUNDED”,
goals:“goals”, goal:“goal”, target:“Target”, activeGoals:“Active Goals”,
personalSavings:“Personal savings”, groupProjects:“Group Projects”, collaborative:“Collaborative”,
ariaAdvisor:“ARIA — AI Financial Advisor”, personalizedAnalysis:“Personalized portfolio analysis available”,
displayCurrency:“Display Currency”,
savingsGoals:“Savings Goals”, activeGoal:“Active Goal”, activeGoals2:“Active Goals”, noGoalsYet:“No Goals Yet”,
defineGoal:“Define your first savings goal to begin building your financial future.”,
createFirstGoal:“Create Your First Goal”, newGoal:”+ New Goal”,
onTrack:“On Track”, atRisk:“⚠ At Risk”, goalAchieved:“✓ Goal Achieved”, funded2:”% funded”,
remaining:“remaining”, of:“of”,
groupSavings:“Group Savings”, collaborativeGoals:“Collaborative Goals”,
saveTogether:“Save together toward a shared financial objective.”,
createGroup:”+ Create Group”, joinGroup:“🔗 Join Group”, noGroupProjects:“No Group Projects”,
createOrJoin:“Create a group or join one using an invitation code.”,
myShare:“My share:”, group:“Group”,
professionalAnalysis:“Professional analysis · Actionable insights”,
helloIAmARIA:“Hello, I’m ARIA”, ariaDesc:“I’m ARIA, your AI financial advisor. I analyze your savings portfolio, identify risks, and provide data-driven recommendations tailored to your goals.”,
analyzePortfolio:“✦ Analyze My Portfolio”, reanalyze:“↺ Re-analyze portfolio”, askARIA:“Ask ARIA a question…”,
responseLanguage:“Response Language”,
account:“Account”, myAccount:“My Account”, totalSaved:“Total Saved”,
plan:“Plan”, signOut:“Sign Out”,
subscriptionPlans:“Subscription Plans”, comingSoon:“Coming Soon”,
legalCompliance:“Legal & Compliance”, kycAml:“KYC, AML, Regulatory”,
securityCenter:“Security Center”, authData:“Authentication & data protection”,
helpSupport:“Help & Support”, faqContact:“FAQ, guides & contact”,
version:“Version 1.0.0 · © 2025 Pro.G · All rights reserved”,
newSavingsGoal:“New Savings Goal”, goalName:“Goal Name”,
goalNamePlaceholder:“e.g. Down Payment, Emergency Fund…”,
category:“Category”, currency2:“Currency”, targetAmount:“Target Amount”, targetDate:“Target Date”,
createGoal:“Create Goal”, depositAmount:“Deposit Amount”, confirmDeposit:“Confirm Deposit”,
withdrawalFee:“Withdrawal fee”, memberContributions:“Member Contributions”,
myDeposit:“My Deposit”, inviteMembers:“Invite Members”, invitationCode:“Invitation Code”,
copy:“Copy”, invite:“Invite”, createGroupTitle:“Create Group”, joinGroupTitle:“Join a Group”,
enterCode:“Enter the invitation code shared by the group administrator.”,
joinGroupBtn:“Join Group”, autoGenCode:“A unique invitation code will be generated automatically for your group.”,
groupNamePlaceholder:“e.g. Family Vacation 2026…”,
selectPlan:“Select Plan”, currentPlan:“This is your current plan”, planIncludes:“Plan Includes”,
popular:“MOST POPULAR”, active:“ACTIVE”, withdrawalFee2:“Withdrawal fee”,
processing:“Processing”, deposited:“deposited”, copied:“Code copied!”,
invalidAmount:“Invalid amount”, fillAllFields:“Please fill all fields”,
alreadyMember:“You are already a member”, codeNotFound:“Code not found”,
inviteSent:“Invitation sent to”, invalidEmail:“Invalid email”,
goalCreated:“Goal created successfully”, groupCreated:“Group created — Code:”,
joinedGroup:“Successfully joined the group”, activated:“plan activated”,
comingSoonMsg:“Coming soon”, daysRemaining:“days remaining”,
suggestions:[“Which goal to prioritize?”,“Am I on track?”,“How to save faster?”,“Analyze my progress”],
step:“Step”, stepOf:“of 3”, back:“← Back”, emailSentTo:“Check your inbox”,
planFeatures:{starter:[“1 savings goal”,“Up to $5,000 objective”,“Basic AI advisor”,“Standard withdrawal”],pro:[“5 savings goals”,“Unlimited objective”,“Advanced AI advisor”,“Group savings”,“24h withdrawal”],elite:[“Unlimited goals”,“Priority AI advisor”,“Unlimited groups”,“Instant withdrawal”,“API access”],business:[“Everything in Elite”,“Team dashboard”,“Multi-account mgmt”,“24/7 priority support”,“Custom billing”]},
upcoming:[{icon:“🔄”,label:“Automated Transfers”,desc:“Direct bank connection”},{icon:“🔔”,label:“Smart Notifications”,desc:“Personalized alerts & reminders”},{icon:“📊”,label:“Wealth Projections”,desc:“Visual forecasting & simulations”},{icon:“🏆”,label:“Milestone Rewards”,desc:“Achievements & incentives”},{icon:“📈”,label:“Pro.G Invest”,desc:“Grow your savings with returns”},{icon:“⚙️”,label:“API Access”,desc:“Integrate with your tools”}],
selectLanguage:“Select Language”, languageChanged:“Language updated”,
nameTaken:“An account with this email already exists”, accountNotFound:“No account found with this email”,
wrongPassword:“Incorrect password”, accountCreated:“Account created successfully”,
invalidCode:“Invalid verification code”, errorTryAgain:“Error. Please try again.”,
loading:“Loading your account…”, passwordsDontMatch:“Passwords do not match”,
passwordTooShort:“Password must be at least 6 characters”, invalidEmailMsg:“Invalid email address”,
enterName:“Please enter your full name”, enterPhone:“Please enter your phone number”,
pinRequired:“Please set a 4-digit PIN”, pinsDontMatch:“PIN codes do not match”,
enterCodeMsg:“Enter an invitation code”,
},
fr:{
appTagline:“Votre plateforme d’épargne intelligente.\nSécurisée, professionnelle, conçue pour croître.”,
openAccount:“Créer un compte”, signIn:“Se connecter”, welcomeTo:“Bienvenue sur”,
bankGrade:“Sécurité\nbancaire”, aiPowered:“Conseils\nIA”, globalCurr:“8+ Devises\nmondiales”,
personalInfo:“Informations personnelles”, provideDetails:“Veuillez renseigner vos informations.”,
fullName:“Nom complet”, emailAddress:“Adresse email”, phone:“Téléphone”,
password:“Mot de passe”, passwordMin:“Minimum 6 caractères”, confirmPassword:“Confirmer le mot de passe”, reEnter:“Ressaisissez votre mot de passe”,
hide:“Cacher”, show:“Voir”, continue:“Continuer →”,
alreadyAccount:“Déjà un compte ?”, noAccount:“Nouveau sur Pro.G ?”,
setPin:“Définir votre PIN”, choosePIN:“Choisissez un code PIN à 4 chiffres pour sécuriser votre accès.”,
yourPin:“Votre PIN”, confirmPin:“Confirmer le PIN”,
verifyEmail:“Vérification de l’email”, codeSentTo:“Un code à 6 chiffres a été envoyé à”,
simulated:“Simulé — votre code apparaît dans la notification ci-dessus.”,
verificationCode:“Code de vérification”, createAccount:“Créer mon compte”, creating:“Création en cours…”,
resendCode:“Renvoyer le code”, signingIn:“Connexion…”,
welcomeBack:“Ravi de vous revoir. Entrez vos identifiants.”,
forgotPassword:“Mot de passe oublié ?”, resetPassword:“Réinitialiser le mot de passe”,
enterEmailReset:“Entrez votre email pour recevoir un lien de réinitialisation.”,
sendResetLink:“Envoyer le lien”, sending:“Envoi…”, checkInbox:“Vérifiez votre boîte mail”,
resetLinkSent:“Un lien a été envoyé à”, backToSignIn:“Retour à la connexion”,
goodDay:“Bonjour,”, totalSavings:“Épargne totale”, funded:“ATTEINT”,
goals:“projets”, goal:“projet”, target:“Objectif”, activeGoals:“Projets actifs”,
personalSavings:“Épargne personnelle”, groupProjects:“Projets collectifs”, collaborative:“Collaboratif”,
ariaAdvisor:“ARIA — Coach IA”, personalizedAnalysis:“Analyse personnalisée disponible”,
displayCurrency:“Devise d’affichage”,
savingsGoals:“Mes projets”, activeGoal:“Projet actif”, activeGoals2:“Projets actifs”, noGoalsYet:“Aucun projet”,
defineGoal:“Créez votre premier projet pour commencer à épargner.”,
createFirstGoal:“Créer mon premier projet”, newGoal:”+ Nouveau”,
onTrack:“En bonne voie”, atRisk:“⚠ À risque”, goalAchieved:“✓ Objectif atteint !”, funded2:”% atteint”,
remaining:“restant”, of:“sur”,
groupSavings:“Épargne collective”, collaborativeGoals:“Projets partagés”,
saveTogether:“Épargnez ensemble vers un objectif commun.”,
createGroup:”+ Créer un groupe”, joinGroup:“🔗 Rejoindre”, noGroupProjects:“Aucun projet collectif”,
createOrJoin:“Créez un groupe ou rejoignez-en un avec un code.”,
myShare:“Ma part :”, group:“Collectif”,
professionalAnalysis:“Analyse bienveillante · Conseils chiffrés”,
helloIAmARIA:“Bonjour, je suis ARIA”, ariaDesc:“Votre coach épargne IA. J’analyse vos projets, identifie les risques et vous guide avec des conseils chiffrés et personnalisés.”,
analyzePortfolio:“✦ Analyser mes projets”, reanalyze:“↺ Relancer l’analyse”, askARIA:“Posez une question à ARIA…”,
responseLanguage:“Langue de réponse”,
account:“Compte”, myAccount:“Mon compte”, totalSaved:“Épargne totale”,
plan:“Plan”, signOut:“Déconnexion”,
subscriptionPlans:“Abonnements”, comingSoon:“Fonctionnalités à venir”,
legalCompliance:“Conformité légale”, kycAml:“KYC, AML, Agrément”,
securityCenter:“Sécurité”, authData:“Authentification & données”,
helpSupport:“Aide & support”, faqContact:“FAQ et contact”,
version:“Version 1.0.0 · © 2025 Pro.G · Tous droits réservés”,
newSavingsGoal:“Nouveau projet”, goalName:“Nom du projet”,
goalNamePlaceholder:“ex: Voyage Tokyo, Villa…”,
category:“Catégorie”, currency2:“Devise”, targetAmount:“Objectif”, targetDate:“Date limite”,
createGoal:“Créer le projet”, depositAmount:“Montant”, confirmDeposit:“Déposer”,
withdrawalFee:“Frais de retrait”, memberContributions:“Contributions des membres”,
myDeposit:“Mon dépôt”, inviteMembers:“Inviter des membres”, invitationCode:“Code d’invitation”,
copy:“Copier”, invite:“Inviter”, createGroupTitle:“Nouveau groupe”, joinGroupTitle:“Rejoindre un groupe”,
enterCode:“Entrez le code partagé par le créateur du groupe.”,
joinGroupBtn:“Rejoindre”, autoGenCode:“Un code unique sera généré automatiquement.”,
groupNamePlaceholder:“ex: Vacances famille 2026…”,
selectPlan:“Choisir ce plan”, currentPlan:“Plan actif”, planIncludes:“Inclus dans ce plan”,
popular:“POPULAIRE”, active:“ACTIF”, withdrawalFee2:“Frais retrait”,
processing:“Traitement”, deposited:“ajouté ✓”, copied:“Code copié !”,
invalidAmount:“Montant invalide”, fillAllFields:“Remplissez tous les champs”,
alreadyMember:“Vous êtes déjà membre”, codeNotFound:“Code introuvable”,
inviteSent:“Invitation envoyée à”, invalidEmail:“Email invalide”,
goalCreated:“Projet créé 🎉”, groupCreated:“Groupe créé — Code :”,
joinedGroup:“Projet rejoint 🎉”, activated:“activé”,
comingSoonMsg:“Disponible bientôt”, daysRemaining:“jours restants”,
suggestions:[“Quel projet prioriser ?”,“Suis-je en bonne voie ?”,“Comment épargner plus vite ?”,“Analyse mes projets”],
step:“Étape”, stepOf:“sur 3”, back:“← Retour”,
planFeatures:{starter:[“1 projet personnel”,“Objectif max 5 000”,“Coach IA basique”,“Retrait sous 5 jours”],pro:[“5 projets personnels”,“Objectif illimité”,“Coach IA avancé”,“Épargne collective”,“Retrait sous 24h”],elite:[“Projets illimités”,“Coach IA premium”,“Groupes illimités”,“Retrait instantané”,“Accès API”],business:[“Tout Elite inclus”,“Tableau équipe”,“Multi-comptes”,“Support 24/7”,“Facturation perso”]},
upcoming:[{icon:“🔄”,label:“Virements automatiques”,desc:“Connexion bancaire directe”},{icon:“🔔”,label:“Notifications push”,desc:“Alertes et rappels personnalisés”},{icon:“📊”,label:“Projections graphiques”,desc:“Simulation et prévisions visuelles”},{icon:“🏆”,label:“Gamification & badges”,desc:“Défis, niveaux et récompenses”},{icon:“📈”,label:“Pro.G Invest”,desc:“Faites fructifier votre épargne”},{icon:“⚙️”,label:“Accès API”,desc:“Intégration dans vos outils”}],
selectLanguage:“Choisir la langue”, languageChanged:“Langue mise à jour”,
nameTaken:“Email déjà utilisé”, accountNotFound:“Compte introuvable”,
wrongPassword:“Mot de passe incorrect”, accountCreated:“Compte créé avec succès”,
invalidCode:“Code incorrect”, errorTryAgain:“Erreur. Réessayez.”,
loading:“Chargement…”, passwordsDontMatch:“Mots de passe différents”,
passwordTooShort:“Mot de passe trop court (6 min)”, invalidEmailMsg:“Email invalide”,
enterName:“Entrez votre nom”, enterPhone:“Entrez votre téléphone”,
pinRequired:“Entrez un code PIN à 4 chiffres”, pinsDontMatch:“Les codes PIN ne correspondent pas”,
enterCodeMsg:“Entrez un code”,
},
es:{
appTagline:“Tu plataforma de ahorro inteligente.\nSegura, profesional y diseñada para crecer.”,
openAccount:“Abrir una cuenta”, signIn:“Iniciar sesión”, welcomeTo:“Bienvenido a”,
bankGrade:“Seguridad\nbancaria”, aiPowered:“Asesoría\ncon IA”, globalCurr:“8+ Divisas\nglobales”,
personalInfo:“Información personal”, provideDetails:“Por favor, ingresa tus datos.”,
fullName:“Nombre completo”, emailAddress:“Correo electrónico”, phone:“Teléfono”,
password:“Contraseña”, passwordMin:“Mínimo 6 caracteres”, confirmPassword:“Confirmar contraseña”, reEnter:“Vuelve a ingresar tu contraseña”,
hide:“Ocultar”, show:“Ver”, continue:“Continuar →”,
alreadyAccount:”¿Ya tienes cuenta?”, noAccount:”¿Nuevo en Pro.G?”,
setPin:“Establece tu PIN”, choosePIN:“Elige un PIN de 4 dígitos para proteger tu cuenta.”,
yourPin:“Tu PIN”, confirmPin:“Confirmar PIN”,
verifyEmail:“Verifica tu email”, codeSentTo:“Se envió un código de 6 dígitos a”,
simulated:“Simulado — tu código aparece en la notificación de arriba.”,
verificationCode:“Código de verificación”, createAccount:“Crear cuenta”, creating:“Creando tu cuenta…”,
resendCode:“Reenviar código”, signingIn:“Iniciando sesión…”,
welcomeBack:“Bienvenido de vuelta. Ingresa tus credenciales.”,
forgotPassword:”¿Olvidaste tu contraseña?”, resetPassword:“Restablecer contraseña”,
enterEmailReset:“Ingresa tu email para recibir un enlace de restablecimiento.”,
sendResetLink:“Enviar enlace”, sending:“Enviando…”, checkInbox:“Revisa tu bandeja de entrada”,
resetLinkSent:“Se envió un enlace a”, backToSignIn:“Volver al inicio de sesión”,
goodDay:“Buenos días,”, totalSavings:“Portafolio de ahorros”, funded:“FINANCIADO”,
goals:“metas”, goal:“meta”, target:“Objetivo”, activeGoals:“Metas activas”,
personalSavings:“Ahorro personal”, groupProjects:“Proyectos grupales”, collaborative:“Colaborativo”,
ariaAdvisor:“ARIA — Asesora IA”, personalizedAnalysis:“Análisis personalizado disponible”,
displayCurrency:“Moneda de visualización”,
savingsGoals:“Mis metas”, activeGoal:“Meta activa”, activeGoals2:“Metas activas”, noGoalsYet:“Sin metas aún”,
defineGoal:“Define tu primera meta de ahorro para comenzar.”,
createFirstGoal:“Crear mi primera meta”, newGoal:”+ Nueva meta”,
onTrack:“En buen camino”, atRisk:“⚠ En riesgo”, goalAchieved:“✓ ¡Meta alcanzada!”, funded2:”% financiado”,
remaining:“restante”, of:“de”,
groupSavings:“Ahorro grupal”, collaborativeGoals:“Metas compartidas”,
saveTogether:“Ahorren juntos hacia un objetivo común.”,
createGroup:”+ Crear grupo”, joinGroup:“🔗 Unirse”, noGroupProjects:“Sin proyectos grupales”,
createOrJoin:“Crea un grupo o únete con un código.”,
myShare:“Mi parte:”, group:“Grupal”,
professionalAnalysis:“Análisis profesional · Recomendaciones concretas”,
helloIAmARIA:“Hola, soy ARIA”, ariaDesc:“Tu asesora financiera IA. Analizo tus metas de ahorro, identifico riesgos y te brindo recomendaciones personalizadas.”,
analyzePortfolio:“✦ Analizar mi portafolio”, reanalyze:“↺ Reanalizar”, askARIA:“Pregúntale a ARIA…”,
responseLanguage:“Idioma de respuesta”,
account:“Cuenta”, myAccount:“Mi cuenta”, totalSaved:“Total ahorrado”,
plan:“Plan”, signOut:“Cerrar sesión”,
subscriptionPlans:“Planes de suscripción”, comingSoon:“Próximamente”,
legalCompliance:“Cumplimiento legal”, kycAml:“KYC, AML, Regulatorio”,
securityCenter:“Centro de seguridad”, authData:“Autenticación y datos”,
helpSupport:“Ayuda y soporte”, faqContact:“FAQ, guías y contacto”,
version:“Versión 1.0.0 · © 2025 Pro.G · Todos los derechos reservados”,
newSavingsGoal:“Nueva meta de ahorro”, goalName:“Nombre de la meta”,
goalNamePlaceholder:“ej: Fondo de emergencia, Casa…”,
category:“Categoría”, currency2:“Moneda”, targetAmount:“Monto objetivo”, targetDate:“Fecha límite”,
createGoal:“Crear meta”, depositAmount:“Monto del depósito”, confirmDeposit:“Confirmar depósito”,
withdrawalFee:“Comisión de retiro”, memberContributions:“Contribuciones de miembros”,
myDeposit:“Mi depósito”, inviteMembers:“Invitar miembros”, invitationCode:“Código de invitación”,
copy:“Copiar”, invite:“Invitar”, createGroupTitle:“Crear grupo”, joinGroupTitle:“Unirse a un grupo”,
enterCode:“Ingresa el código compartido por el administrador del grupo.”,
joinGroupBtn:“Unirse”, autoGenCode:“Se generará un código único automáticamente.”,
groupNamePlaceholder:“ej: Vacaciones familia 2026…”,
selectPlan:“Seleccionar plan”, currentPlan:“Este es tu plan actual”, planIncludes:“Incluye”,
popular:“MÁS POPULAR”, active:“ACTIVO”, withdrawalFee2:“Comisión retiro”,
processing:“Procesando”, deposited:“depositado”, copied:”¡Código copiado!”,
invalidAmount:“Monto inválido”, fillAllFields:“Por favor completa todos los campos”,
alreadyMember:“Ya eres miembro”, codeNotFound:“Código no encontrado”,
inviteSent:“Invitación enviada a”, invalidEmail:“Email inválido”,
goalCreated:“Meta creada con éxito”, groupCreated:“Grupo creado — Código:”,
joinedGroup:“Te uniste al grupo con éxito”, activated:“activado”,
comingSoonMsg:“Próximamente”, daysRemaining:“días restantes”,
suggestions:[”¿Qué meta priorizar?”,”¿Voy por buen camino?”,”¿Cómo ahorrar más rápido?”,“Analiza mi progreso”],
step:“Paso”, stepOf:“de 3”, back:“← Volver”,
planFeatures:{starter:[“1 meta de ahorro”,“Hasta $5,000 objetivo”,“Asesor IA básico”,“Retiro estándar”],pro:[“5 metas de ahorro”,“Objetivo ilimitado”,“Asesor IA avanzado”,“Ahorro grupal”,“Retiro en 24h”],elite:[“Metas ilimitadas”,“Asesor IA premium”,“Grupos ilimitados”,“Retiro instantáneo”,“Acceso API”],business:[“Todo en Elite”,“Panel de equipo”,“Multi-cuenta”,“Soporte 24/7”,“Facturación personalizada”]},
upcoming:[{icon:“🔄”,label:“Transferencias automáticas”,desc:“Conexión bancaria directa”},{icon:“🔔”,label:“Notificaciones inteligentes”,desc:“Alertas y recordatorios personalizados”},{icon:“📊”,label:“Proyecciones financieras”,desc:“Simulaciones visuales”},{icon:“🏆”,label:“Logros y recompensas”,desc:“Desafíos e incentivos”},{icon:“📈”,label:“Pro.G Invest”,desc:“Haz crecer tus ahorros”},{icon:“⚙️”,label:“Acceso API”,desc:“Integra con tus herramientas”}],
selectLanguage:“Seleccionar idioma”, languageChanged:“Idioma actualizado”,
nameTaken:“Ya existe una cuenta con este email”, accountNotFound:“No se encontró cuenta con este email”,
wrongPassword:“Contraseña incorrecta”, accountCreated:“Cuenta creada con éxito”,
invalidCode:“Código inválido”, errorTryAgain:“Error. Inténtalo de nuevo.”,
loading:“Cargando tu cuenta…”, passwordsDontMatch:“Las contraseñas no coinciden”,
passwordTooShort:“Contraseña demasiado corta (mín. 6)”, invalidEmailMsg:“Email inválido”,
enterName:“Ingresa tu nombre”, enterPhone:“Ingresa tu teléfono”,
pinRequired:“Ingresa un PIN de 4 dígitos”, pinsDontMatch:“Los PIN no coinciden”,
enterCodeMsg:“Ingresa un código”,
},
ar:{
appTagline:“منصتك الذكية للادخار.\nآمنة، احترافية، ومصممة للنمو.”,
openAccount:“فتح حساب”, signIn:“تسجيل الدخول”, welcomeTo:“مرحباً بك في”,
bankGrade:“أمان\nمصرفي”, aiPowered:“نصائح\nبالذكاء الاصطناعي”, globalCurr:“8+ عملات\nعالمية”,
personalInfo:“المعلومات الشخصية”, provideDetails:“يرجى تقديم بياناتك للبدء.”,
fullName:“الاسم الكامل”, emailAddress:“البريد الإلكتروني”, phone:“رقم الهاتف”,
password:“كلمة المرور”, passwordMin:“6 أحرف على الأقل”, confirmPassword:“تأكيد كلمة المرور”, reEnter:“أعد إدخال كلمة المرور”,
hide:“إخفاء”, show:“إظهار”, continue:“متابعة →”,
alreadyAccount:“لديك حساب بالفعل؟”, noAccount:“جديد على Pro.G؟”,
setPin:“تعيين رمز PIN”, choosePIN:“اختر رمز PIN من 4 أرقام لتأمين حسابك.”,
yourPin:“رمز PIN الخاص بك”, confirmPin:“تأكيد رمز PIN”,
verifyEmail:“التحقق من البريد الإلكتروني”, codeSentTo:“تم إرسال رمز من 6 أرقام إلى”,
simulated:“محاكاة — يظهر رمزك في الإشعار أعلاه.”,
verificationCode:“رمز التحقق”, createAccount:“إنشاء الحساب”, creating:“جارٍ إنشاء حسابك…”,
resendCode:“إعادة إرسال الرمز”, signingIn:“جارٍ تسجيل الدخول…”,
welcomeBack:“مرحباً بعودتك. أدخل بيانات اعتمادك.”,
forgotPassword:“نسيت كلمة المرور؟”, resetPassword:“إعادة تعيين كلمة المرور”,
enterEmailReset:“أدخل بريدك الإلكتروني لاستلام رابط إعادة التعيين.”,
sendResetLink:“إرسال الرابط”, sending:“جارٍ الإرسال…”, checkInbox:“تحقق من بريدك الوارد”,
resetLinkSent:“تم إرسال رابط إلى”, backToSignIn:“العودة لتسجيل الدخول”,
goodDay:“مرحباً،”, totalSavings:“محفظة المدخرات الإجمالية”, funded:“ممول”,
goals:“أهداف”, goal:“هدف”, target:“الهدف”, activeGoals:“الأهداف النشطة”,
personalSavings:“المدخرات الشخصية”, groupProjects:“المشاريع الجماعية”, collaborative:“تعاوني”,
ariaAdvisor:“ARIA — المستشارة الذكية”, personalizedAnalysis:“تحليل محفظتك الشخصية متاح”,
displayCurrency:“عملة العرض”,
savingsGoals:“أهدافي”, activeGoal:“هدف نشط”, activeGoals2:“أهداف نشطة”, noGoalsYet:“لا أهداف بعد”,
defineGoal:“حدد هدفك الادخاري الأول لبدء بناء مستقبلك المالي.”,
createFirstGoal:“إنشاء هدفي الأول”, newGoal:”+ هدف جديد”,
onTrack:“على المسار”, atRisk:“⚠ في خطر”, goalAchieved:“✓ تم تحقيق الهدف!”, funded2:”% ممول”,
remaining:“متبقي”, of:“من”,
groupSavings:“الادخار الجماعي”, collaborativeGoals:“أهداف مشتركة”,
saveTogether:“ادخروا معاً نحو هدف مالي مشترك.”,
createGroup:”+ إنشاء مجموعة”, joinGroup:“🔗 الانضمام”, noGroupProjects:“لا مشاريع جماعية”,
createOrJoin:“أنشئ مجموعة أو انضم إليها برمز الدعوة.”,
myShare:“حصتي:”, group:“جماعي”,
professionalAnalysis:“تحليل احترافي · توصيات قابلة للتنفيذ”,
helloIAmARIA:“مرحباً، أنا ARIA”, ariaDesc:“مستشارتك المالية بالذكاء الاصطناعي. أحلل محفظتك وأحدد المخاطر وأقدم توصيات مخصصة.”,
analyzePortfolio:“✦ تحليل محفظتي”, reanalyze:“↺ إعادة التحليل”, askARIA:“اسأل ARIA…”,
responseLanguage:“لغة الرد”,
account:“الحساب”, myAccount:“حسابي”, totalSaved:“إجمالي المدخرات”,
plan:“الخطة”, signOut:“تسجيل الخروج”,
subscriptionPlans:“خطط الاشتراك”, comingSoon:“قريباً”,
legalCompliance:“الامتثال القانوني”, kycAml:“KYC، AML، التنظيم”,
securityCenter:“مركز الأمان”, authData:“المصادقة وحماية البيانات”,
helpSupport:“المساعدة والدعم”, faqContact:“الأسئلة الشائعة والتواصل”,
version:“الإصدار 1.0.0 · © 2025 Pro.G · جميع الحقوق محفوظة”,
newSavingsGoal:“هدف ادخاري جديد”, goalName:“اسم الهدف”,
goalNamePlaceholder:“مثال: دفعة أولى، صندوق طوارئ…”,
category:“الفئة”, currency2:“العملة”, targetAmount:“المبلغ المستهدف”, targetDate:“تاريخ الهدف”,
createGoal:“إنشاء الهدف”, depositAmount:“مبلغ الإيداع”, confirmDeposit:“تأكيد الإيداع”,
withdrawalFee:“رسوم السحب”, memberContributions:“مساهمات الأعضاء”,
myDeposit:“إيداعي”, inviteMembers:“دعوة أعضاء”, invitationCode:“رمز الدعوة”,
copy:“نسخ”, invite:“دعوة”, createGroupTitle:“إنشاء مجموعة”, joinGroupTitle:“الانضمام لمجموعة”,
enterCode:“أدخل رمز الدعوة المشارك من قبل منشئ المجموعة.”,
joinGroupBtn:“الانضمام”, autoGenCode:“سيتم إنشاء رمز فريد تلقائياً لمجموعتك.”,
groupNamePlaceholder:“مثال: عطلة عائلية 2026…”,
selectPlan:“اختر هذه الخطة”, currentPlan:“هذه خطتك الحالية”, planIncludes:“ما تشمله الخطة”,
popular:“الأكثر شيوعاً”, active:“نشط”, withdrawalFee2:“رسوم السحب”,
processing:“جارٍ المعالجة”, deposited:“تم الإيداع”, copied:“تم نسخ الرمز!”,
invalidAmount:“مبلغ غير صالح”, fillAllFields:“يرجى ملء جميع الحقول”,
alreadyMember:“أنت عضو بالفعل”, codeNotFound:“الرمز غير موجود”,
inviteSent:“تم إرسال الدعوة إلى”, invalidEmail:“بريد إلكتروني غير صالح”,
goalCreated:“تم إنشاء الهدف بنجاح”, groupCreated:“تم إنشاء المجموعة — الرمز:”,
joinedGroup:“انضممت للمجموعة بنجاح”, activated:“تم تفعيله”,
comingSoonMsg:“قريباً”, daysRemaining:“أيام متبقية”,
suggestions:[“ما الهدف الذي يجب تحديد أولويته؟”,“هل أسير على المسار الصحيح؟”,“كيف أوفر أكثر؟”,“حلل تقدمي”],
step:“الخطوة”, stepOf:“من 3”, back:“→ رجوع”,
planFeatures:{starter:[“هدف ادخار واحد”,“حتى 5,000 هدف”,“مستشار ذكاء اصطناعي أساسي”,“سحب قياسي”],pro:[“5 أهداف ادخار”,“هدف غير محدود”,“مستشار ذكاء اصطناعي متقدم”,“الادخار الجماعي”,“سحب خلال 24 ساعة”],elite:[“أهداف غير محدودة”,“مستشار ذكاء اصطناعي ممتاز”,“مجموعات غير محدودة”,“سحب فوري”,“وصول API”],business:[“كل شيء في Elite”,“لوحة تحكم الفريق”,“إدارة متعددة الحسابات”,“دعم 24/7”,“فواتير مخصصة”]},
upcoming:[{icon:“🔄”,label:“التحويلات التلقائية”,desc:“ربط مباشر بالبنك”},{icon:“🔔”,label:“الإشعارات الذكية”,desc:“تنبيهات وتذكيرات شخصية”},{icon:“📊”,label:“توقعات الثروة”,desc:“محاكاة مرئية وتوقعات”},{icon:“🏆”,label:“مكافآت الإنجاز”,desc:“تحديات وحوافز”},{icon:“📈”,label:“Pro.G Invest”,desc:“نمّ مدخراتك”},{icon:“⚙️”,label:“وصول API”,desc:“تكامل مع أدواتك”}],
selectLanguage:“اختر اللغة”, languageChanged:“تم تحديث اللغة”,
nameTaken:“يوجد حساب بهذا البريد الإلكتروني”, accountNotFound:“لم يتم العثور على حساب بهذا البريد”,
wrongPassword:“كلمة المرور غير صحيحة”, accountCreated:“تم إنشاء الحساب بنجاح”,
invalidCode:“رمز غير صالح”, errorTryAgain:“خطأ. يرجى المحاولة مجدداً.”,
loading:“جارٍ تحميل حسابك…”, passwordsDontMatch:“كلمتا المرور غير متطابقتين”,
passwordTooShort:“كلمة المرور قصيرة جداً (6 على الأقل)”, invalidEmailMsg:“بريد إلكتروني غير صالح”,
enterName:“أدخل اسمك”, enterPhone:“أدخل رقم هاتفك”,
pinRequired:“أدخل رمز PIN من 4 أرقام”, pinsDontMatch:“رمزا PIN غير متطابقين”,
enterCodeMsg:“أدخل رمزاً”,
},
pt:{
appTagline:“Sua plataforma inteligente de poupança.\nSegura, profissional e criada para crescer.”,
openAccount:“Abrir uma conta”, signIn:“Entrar”, welcomeTo:“Bem-vindo ao”,
bankGrade:“Segurança\nbancária”, aiPowered:“Consultoria\ncom IA”, globalCurr:“8+ Moedas\nglobais”,
personalInfo:“Informações pessoais”, provideDetails:“Por favor, forneça seus dados para começar.”,
fullName:“Nome completo”, emailAddress:“Endereço de email”, phone:“Telefone”,
password:“Senha”, passwordMin:“Mínimo 6 caracteres”, confirmPassword:“Confirmar senha”, reEnter:“Digite sua senha novamente”,
hide:“Ocultar”, show:“Ver”, continue:“Continuar →”,
alreadyAccount:“Já tem uma conta?”, noAccount:“Novo no Pro.G?”,
setPin:“Definir PIN”, choosePIN:“Escolha um PIN de 4 dígitos para proteger sua conta.”,
yourPin:“Seu PIN”, confirmPin:“Confirmar PIN”,
verifyEmail:“Verificar email”, codeSentTo:“Um código de 6 dígitos foi enviado para”,
simulated:“Simulado — seu código aparece na notificação acima.”,
verificationCode:“Código de verificação”, createAccount:“Criar conta”, creating:“Criando sua conta…”,
resendCode:“Reenviar código”, signingIn:“Entrando…”,
welcomeBack:“Bem-vindo de volta. Digite suas credenciais.”,
forgotPassword:“Esqueceu a senha?”, resetPassword:“Redefinir senha”,
enterEmailReset:“Digite seu email para receber um link de redefinição.”,
sendResetLink:“Enviar link”, sending:“Enviando…”, checkInbox:“Verifique sua caixa de entrada”,
resetLinkSent:“Um link foi enviado para”, backToSignIn:“Voltar ao login”,
goodDay:“Bom dia,”, totalSavings:“Portfólio de poupança”, funded:“FINANCIADO”,
goals:“metas”, goal:“meta”, target:“Objetivo”, activeGoals:“Metas ativas”,
personalSavings:“Poupança pessoal”, groupProjects:“Projetos em grupo”, collaborative:“Colaborativo”,
ariaAdvisor:“ARIA — Consultora IA”, personalizedAnalysis:“Análise personalizada disponível”,
displayCurrency:“Moeda de exibição”,
savingsGoals:“Minhas metas”, activeGoal:“Meta ativa”, activeGoals2:“Metas ativas”, noGoalsYet:“Sem metas ainda”,
defineGoal:“Defina sua primeira meta de poupança para começar.”,
createFirstGoal:“Criar minha primeira meta”, newGoal:”+ Nova meta”,
onTrack:“No caminho certo”, atRisk:“⚠ Em risco”, goalAchieved:“✓ Meta atingida!”, funded2:”% financiado”,
remaining:“restante”, of:“de”,
groupSavings:“Poupança em grupo”, collaborativeGoals:“Metas compartilhadas”,
saveTogether:“Poupem juntos em direção a um objetivo financeiro comum.”,
createGroup:”+ Criar grupo”, joinGroup:“🔗 Participar”, noGroupProjects:“Sem projetos em grupo”,
createOrJoin:“Crie um grupo ou participe com um código de convite.”,
myShare:“Minha parte:”, group:“Grupo”,
professionalAnalysis:“Análise profissional · Recomendações acionáveis”,
helloIAmARIA:“Olá, sou ARIA”, ariaDesc:“Sua consultora financeira de IA. Analiso suas metas, identifico riscos e forneço recomendações personalizadas.”,
analyzePortfolio:“✦ Analisar meu portfólio”, reanalyze:“↺ Reanalisar”, askARIA:“Pergunte à ARIA…”,
responseLanguage:“Idioma de resposta”,
account:“Conta”, myAccount:“Minha conta”, totalSaved:“Total poupado”,
plan:“Plano”, signOut:“Sair”,
subscriptionPlans:“Planos de assinatura”, comingSoon:“Em breve”,
legalCompliance:“Conformidade legal”, kycAml:“KYC, AML, Regulatório”,
securityCenter:“Central de segurança”, authData:“Autenticação e proteção de dados”,
helpSupport:“Ajuda e suporte”, faqContact:“FAQ, guias e contato”,
version:“Versão 1.0.0 · © 2025 Pro.G · Todos os direitos reservados”,
newSavingsGoal:“Nova meta de poupança”, goalName:“Nome da meta”,
goalNamePlaceholder:“ex: Entrada do apartamento, Viagem…”,
category:“Categoria”, currency2:“Moeda”, targetAmount:“Valor alvo”, targetDate:“Data limite”,
createGoal:“Criar meta”, depositAmount:“Valor do depósito”, confirmDeposit:“Confirmar depósito”,
withdrawalFee:“Taxa de saque”, memberContributions:“Contribuições dos membros”,
myDeposit:“Meu depósito”, inviteMembers:“Convidar membros”, invitationCode:“Código de convite”,
copy:“Copiar”, invite:“Convidar”, createGroupTitle:“Criar grupo”, joinGroupTitle:“Entrar em um grupo”,
enterCode:“Digite o código compartilhado pelo criador do grupo.”,
joinGroupBtn:“Entrar”, autoGenCode:“Um código único será gerado automaticamente para o seu grupo.”,
groupNamePlaceholder:“ex: Férias família 2026…”,
selectPlan:“Selecionar plano”, currentPlan:“Este é seu plano atual”, planIncludes:“O plano inclui”,
popular:“MAIS POPULAR”, active:“ATIVO”, withdrawalFee2:“Taxa de saque”,
processing:“Processando”, deposited:“depositado”, copied:“Código copiado!”,
invalidAmount:“Valor inválido”, fillAllFields:“Por favor, preencha todos os campos”,
alreadyMember:“Você já é membro”, codeNotFound:“Código não encontrado”,
inviteSent:“Convite enviado para”, invalidEmail:“Email inválido”,
goalCreated:“Meta criada com sucesso”, groupCreated:“Grupo criado — Código:”,
joinedGroup:“Você entrou no grupo com sucesso”, activated:“ativado”,
comingSoonMsg:“Em breve”, daysRemaining:“dias restantes”,
suggestions:[“Qual meta priorizar?”,“Estou no caminho certo?”,“Como poupar mais rápido?”,“Analise meu progresso”],
step:“Etapa”, stepOf:“de 3”, back:“← Voltar”,
planFeatures:{starter:[“1 meta de poupança”,“Até $5.000 objetivo”,“Consultor IA básico”,“Saque padrão”],pro:[“5 metas”,“Objetivo ilimitado”,“Consultor IA avançado”,“Poupança em grupo”,“Saque em 24h”],elite:[“Metas ilimitadas”,“Consultor IA premium”,“Grupos ilimitados”,“Saque instantâneo”,“Acesso API”],business:[“Tudo no Elite”,“Painel da equipe”,“Multi-conta”,“Suporte 24/7”,“Faturamento personalizado”]},
upcoming:[{icon:“🔄”,label:“Transferências automáticas”,desc:“Conexão bancária direta”},{icon:“🔔”,label:“Notificações inteligentes”,desc:“Alertas e lembretes personalizados”},{icon:“📊”,label:“Projeções financeiras”,desc:“Simulações visuais”},{icon:“🏆”,label:“Recompensas por marcos”,desc:“Conquistas e incentivos”},{icon:“📈”,label:“Pro.G Invest”,desc:“Faça seu dinheiro render”},{icon:“⚙️”,label:“Acesso API”,desc:“Integre com suas ferramentas”}],
selectLanguage:“Selecionar idioma”, languageChanged:“Idioma atualizado”,
nameTaken:“Já existe uma conta com este email”, accountNotFound:“Nenhuma conta encontrada com este email”,
wrongPassword:“Senha incorreta”, accountCreated:“Conta criada com sucesso”,
invalidCode:“Código inválido”, errorTryAgain:“Erro. Tente novamente.”,
loading:“Carregando sua conta…”, passwordsDontMatch:“As senhas não coincidem”,
passwordTooShort:“Senha muito curta (mín. 6)”, invalidEmailMsg:“Email inválido”,
enterName:“Digite seu nome”, enterPhone:“Digite seu telefone”,
pinRequired:“Digite um PIN de 4 dígitos”, pinsDontMatch:“Os PINs não coincidem”,
enterCodeMsg:“Digite um código”,
},
de:{
appTagline:“Ihre intelligente Sparplattform.\nSicher, professionell und auf Wachstum ausgerichtet.”,
openAccount:“Konto eröffnen”, signIn:“Anmelden”, welcomeTo:“Willkommen bei”,
bankGrade:“Bank-\nSicherheit”, aiPowered:“KI-gestützte\nBeratung”, globalCurr:“8+ globale\nWährungen”,
personalInfo:“Persönliche Informationen”, provideDetails:“Bitte geben Sie Ihre Daten ein.”,
fullName:“Vollständiger Name”, emailAddress:“E-Mail-Adresse”, phone:“Telefon”,
password:“Passwort”, passwordMin:“Mindestens 6 Zeichen”, confirmPassword:“Passwort bestätigen”, reEnter:“Passwort wiederholen”,
hide:“Verbergen”, show:“Anzeigen”, continue:“Weiter →”,
alreadyAccount:“Haben Sie bereits ein Konto?”, noAccount:“Neu bei Pro.G?”,
setPin:“PIN festlegen”, choosePIN:“Wählen Sie eine 4-stellige PIN zum Schutz Ihres Kontos.”,
yourPin:“Ihre PIN”, confirmPin:“PIN bestätigen”,
verifyEmail:“E-Mail verifizieren”, codeSentTo:“Ein 6-stelliger Code wurde gesendet an”,
simulated:“Simuliert — Ihr Code wird in der Benachrichtigung oben angezeigt.”,
verificationCode:“Verifizierungscode”, createAccount:“Konto erstellen”, creating:“Konto wird erstellt…”,
resendCode:“Code erneut senden”, signingIn:“Anmelden…”,
welcomeBack:“Willkommen zurück. Bitte geben Sie Ihre Anmeldedaten ein.”,
forgotPassword:“Passwort vergessen?”, resetPassword:“Passwort zurücksetzen”,
enterEmailReset:“Geben Sie Ihre E-Mail ein, um einen Reset-Link zu erhalten.”,
sendResetLink:“Link senden”, sending:“Senden…”, checkInbox:“Überprüfen Sie Ihren Posteingang”,
resetLinkSent:“Ein Link wurde gesendet an”, backToSignIn:“Zurück zur Anmeldung”,
goodDay:“Guten Tag,”, totalSavings:“Gesamt-Sparportfolio”, funded:“FINANZIERT”,
goals:“Ziele”, goal:“Ziel”, target:“Ziel”, activeGoals:“Aktive Ziele”,
personalSavings:“Persönliche Ersparnisse”, groupProjects:“Gruppenprojekte”, collaborative:“Kollaborativ”,
ariaAdvisor:“ARIA — KI-Beraterin”, personalizedAnalysis:“Personalisierte Portfolio-Analyse verfügbar”,
displayCurrency:“Anzeigewährung”,
savingsGoals:“Meine Ziele”, activeGoal:“Aktives Ziel”, activeGoals2:“Aktive Ziele”, noGoalsYet:“Noch keine Ziele”,
defineGoal:“Definieren Sie Ihr erstes Sparziel.”,
createFirstGoal:“Erstes Ziel erstellen”, newGoal:”+ Neues Ziel”,
onTrack:“Auf Kurs”, atRisk:“⚠ Gefährdet”, goalAchieved:“✓ Ziel erreicht!”, funded2:”% finanziert”,
remaining:“verbleibend”, of:“von”,
groupSavings:“Gruppensparen”, collaborativeGoals:“Gemeinsame Ziele”,
saveTogether:“Sparen Sie gemeinsam auf ein gemeinsames Finanzziel hin.”,
createGroup:”+ Gruppe erstellen”, joinGroup:“🔗 Beitreten”, noGroupProjects:“Keine Gruppenprojekte”,
createOrJoin:“Erstellen Sie eine Gruppe oder treten Sie einer mit einem Code bei.”,
myShare:“Mein Anteil:”, group:“Gruppe”,
professionalAnalysis:“Professionelle Analyse · Umsetzbare Empfehlungen”,
helloIAmARIA:“Hallo, ich bin ARIA”, ariaDesc:“Ihre KI-Finanzberaterin. Ich analysiere Ihr Sparportfolio und gebe Ihnen maßgeschneiderte Empfehlungen.”,
analyzePortfolio:“✦ Portfolio analysieren”, reanalyze:“↺ Neu analysieren”, askARIA:“Fragen Sie ARIA…”,
responseLanguage:“Antwortsprache”,
account:“Konto”, myAccount:“Mein Konto”, totalSaved:“Gesamt gespart”,
plan:“Plan”, signOut:“Abmelden”,
subscriptionPlans:“Abonnementpläne”, comingSoon:“Demnächst”,
legalCompliance:“Rechtskonformität”, kycAml:“KYC, AML, Regulierung”,
securityCenter:“Sicherheitszentrum”, authData:“Authentifizierung & Datenschutz”,
helpSupport:“Hilfe & Support”, faqContact:“FAQ, Anleitungen & Kontakt”,
version:“Version 1.0.0 · © 2025 Pro.G · Alle Rechte vorbehalten”,
newSavingsGoal:“Neues Sparziel”, goalName:“Zielname”,
goalNamePlaceholder:“z.B. Anzahlung, Notfallfonds…”,
category:“Kategorie”, currency2:“Währung”, targetAmount:“Zielbetrag”, targetDate:“Zieldatum”,
createGoal:“Ziel erstellen”, depositAmount:“Einzahlungsbetrag”, confirmDeposit:“Einzahlung bestätigen”,
withdrawalFee:“Auszahlungsgebühr”, memberContributions:“Mitgliederbeiträge”,
myDeposit:“Meine Einzahlung”, inviteMembers:“Mitglieder einladen”, invitationCode:“Einladungscode”,
copy:“Kopieren”, invite:“Einladen”, createGroupTitle:“Gruppe erstellen”, joinGroupTitle:“Gruppe beitreten”,
enterCode:“Geben Sie den vom Gruppenersteller geteilten Code ein.”,
joinGroupBtn:“Beitreten”, autoGenCode:“Ein eindeutiger Code wird automatisch generiert.”,
groupNamePlaceholder:“z.B. Familienurlaub 2026…”,
selectPlan:“Plan wählen”, currentPlan:“Dies ist Ihr aktueller Plan”, planIncludes:“Im Plan enthalten”,
popular:“AM BELIEBTESTEN”, active:“AKTIV”, withdrawalFee2:“Auszahlungsgebühr”,
processing:“Verarbeitung”, deposited:“eingezahlt”, copied:“Code kopiert!”,
invalidAmount:“Ungültiger Betrag”, fillAllFields:“Bitte alle Felder ausfüllen”,
alreadyMember:“Sie sind bereits Mitglied”, codeNotFound:“Code nicht gefunden”,
inviteSent:“Einladung gesendet an”, invalidEmail:“Ungültige E-Mail”,
goalCreated:“Ziel erfolgreich erstellt”, groupCreated:“Gruppe erstellt — Code:”,
joinedGroup:“Erfolgreich der Gruppe beigetreten”, activated:“aktiviert”,
comingSoonMsg:“Demnächst”, daysRemaining:“Tage verbleibend”,
suggestions:[“Welches Ziel priorisieren?”,“Bin ich auf Kurs?”,“Wie schneller sparen?”,“Meinen Fortschritt analysieren”],
step:“Schritt”, stepOf:“von 3”, back:“← Zurück”,
planFeatures:{starter:[“1 Sparziel”,“Bis zu 5.000 Ziel”,“Basis-KI-Berater”,“Standard-Auszahlung”],pro:[“5 Sparziele”,“Unbegrenztes Ziel”,“Erweiterter KI-Berater”,“Gruppensparen”,“24h-Auszahlung”],elite:[“Unbegrenzte Ziele”,“Premium-KI-Berater”,“Unbegrenzte Gruppen”,“Sofortige Auszahlung”,“API-Zugang”],business:[“Alles in Elite”,“Team-Dashboard”,“Multi-Konto-Verwaltung”,“24/7-Support”,“Benutzerdefinierte Abrechnung”]},
upcoming:[{icon:“🔄”,label:“Automatische Überweisungen”,desc:“Direkte Bankverbindung”},{icon:“🔔”,label:“Intelligente Benachrichtigungen”,desc:“Personalisierte Erinnerungen”},{icon:“📊”,label:“Vermögensprognosen”,desc:“Visuelle Simulationen”},{icon:“🏆”,label:“Meilenstein-Belohnungen”,desc:“Errungenschaften und Anreize”},{icon:“📈”,label:“Pro.G Invest”,desc:“Lassen Sie Ihr Geld wachsen”},{icon:“⚙️”,label:“API-Zugang”,desc:“In Ihre Tools integrieren”}],
selectLanguage:“Sprache auswählen”, languageChanged:“Sprache aktualisiert”,
nameTaken:“Ein Konto mit dieser E-Mail existiert bereits”, accountNotFound:“Kein Konto mit dieser E-Mail gefunden”,
wrongPassword:“Falsches Passwort”, accountCreated:“Konto erfolgreich erstellt”,
invalidCode:“Ungültiger Code”, errorTryAgain:“Fehler. Bitte versuchen Sie es erneut.”,
loading:“Ihr Konto wird geladen…”, passwordsDontMatch:“Passwörter stimmen nicht überein”,
passwordTooShort:“Passwort zu kurz (min. 6)”, invalidEmailMsg:“Ungültige E-Mail”,
enterName:“Bitte geben Sie Ihren Namen ein”, enterPhone:“Bitte geben Sie Ihre Telefonnummer ein”,
pinRequired:“Bitte geben Sie eine 4-stellige PIN ein”, pinsDontMatch:“PINs stimmen nicht überein”,
enterCodeMsg:“Code eingeben”,
},
zh:{
appTagline:“您的智能储蓄平台。\n安全、专业，专为增长而设计。”,
openAccount:“开设账户”, signIn:“登录”, welcomeTo:“欢迎使用”,
bankGrade:“银行级\n安全保障”, aiPowered:“AI驱动\n财务建议”, globalCurr:“8+全球\n货币支持”,
personalInfo:“个人信息”, provideDetails:“请提供您的详细信息以开始使用。”,
fullName:“全名”, emailAddress:“电子邮件地址”, phone:“电话号码”,
password:“密码”, passwordMin:“最少6个字符”, confirmPassword:“确认密码”, reEnter:“请再次输入密码”,
hide:“隐藏”, show:“显示”, continue:“继续 →”,
alreadyAccount:“已有账户？”, noAccount:“Pro.G新用户？”,
setPin:“设置PIN码”, choosePIN:“选择4位PIN码以保护您的账户访问。”,
yourPin:“您的PIN码”, confirmPin:“确认PIN码”,
verifyEmail:“验证电子邮件”, codeSentTo:“6位验证码已发送至”,
simulated:“模拟 — 您的验证码显示在上方通知中。”,
verificationCode:“验证码”, createAccount:“创建账户”, creating:“正在创建您的账户…”,
resendCode:“重新发送验证码”, signingIn:“正在登录…”,
welcomeBack:“欢迎回来。请输入您的凭据。”,
forgotPassword:“忘记密码？”, resetPassword:“重置密码”,
enterEmailReset:“输入您的电子邮件以接收安全重置链接。”,
sendResetLink:“发送重置链接”, sending:“发送中…”, checkInbox:“请查看您的收件箱”,
resetLinkSent:“重置链接已发送至”, backToSignIn:“返回登录”,
goodDay:“您好，”, totalSavings:“储蓄总组合”, funded:“已达成”,
goals:“目标”, goal:“目标”, target:“目标金额”, activeGoals:“活跃目标”,
personalSavings:“个人储蓄”, groupProjects:“群体项目”, collaborative:“协作”,
ariaAdvisor:“ARIA — AI财务顾问”, personalizedAnalysis:“个性化投资组合分析可用”,
displayCurrency:“显示货币”,
savingsGoals:“我的目标”, activeGoal:“活跃目标”, activeGoals2:“活跃目标”, noGoalsYet:“暂无目标”,
defineGoal:“定义您的第一个储蓄目标，开始建立您的财务未来。”,
createFirstGoal:“创建第一个目标”, newGoal:”+ 新目标”,
onTrack:“进展顺利”, atRisk:“⚠ 存在风险”, goalAchieved:“✓ 目标达成！”, funded2:”% 已完成”,
remaining:“剩余”, of:“共”,
groupSavings:“群体储蓄”, collaborativeGoals:“共同目标”,
saveTogether:“共同为共同的财务目标而储蓄。”,
createGroup:”+ 创建群组”, joinGroup:“🔗 加入”, noGroupProjects:“暂无群体项目”,
createOrJoin:“创建群组或使用邀请码加入。”,
myShare:“我的份额:”, group:“群体”,
professionalAnalysis:“专业分析 · 可执行的建议”,
helloIAmARIA:“您好，我是ARIA”, ariaDesc:“您的AI财务顾问。我分析您的储蓄组合，识别风险并提供量身定制的建议。”,
analyzePortfolio:“✦ 分析我的组合”, reanalyze:“↺ 重新分析”, askARIA:“向ARIA提问…”,
responseLanguage:“响应语言”,
account:“账户”, myAccount:“我的账户”, totalSaved:“总储蓄”,
plan:“方案”, signOut:“退出登录”,
subscriptionPlans:“订阅方案”, comingSoon:“即将推出”,
legalCompliance:“法律合规”, kycAml:“KYC、AML、监管”,
securityCenter:“安全中心”, authData:“认证与数据保护”,
helpSupport:“帮助与支持”, faqContact:“常见问题、指南和联系方式”,
version:“版本 1.0.0 · © 2025 Pro.G · 版权所有”,
newSavingsGoal:“新储蓄目标”, goalName:“目标名称”,
goalNamePlaceholder:“例如：首付款、应急基金…”,
category:“类别”, currency2:“货币”, targetAmount:“目标金额”, targetDate:“目标日期”,
createGoal:“创建目标”, depositAmount:“存款金额”, confirmDeposit:“确认存款”,
withdrawalFee:“提现费用”, memberContributions:“成员贡献”,
myDeposit:“我的存款”, inviteMembers:“邀请成员”, invitationCode:“邀请码”,
copy:“复制”, invite:“邀请”, createGroupTitle:“创建群组”, joinGroupTitle:“加入群组”,
enterCode:“输入群组创建者分享的邀请码。”,
joinGroupBtn:“加入”, autoGenCode:“将自动为您的群组生成唯一邀请码。”,
groupNamePlaceholder:“例如：2026年家庭旅行…”,
selectPlan:“选择此方案”, currentPlan:“这是您当前的方案”, planIncludes:“方案包含”,
popular:“最受欢迎”, active:“已激活”, withdrawalFee2:“提现费率”,
processing:“处理中”, deposited:“已存入”, copied:“验证码已复制！”,
invalidAmount:“无效金额”, fillAllFields:“请填写所有字段”,
alreadyMember:“您已经是成员”, codeNotFound:“未找到该邀请码”,
inviteSent:“邀请已发送至”, invalidEmail:“无效电子邮件”,
goalCreated:“目标创建成功”, groupCreated:“群组已创建 — 邀请码：”,
joinedGroup:“成功加入群组”, activated:“已激活”,
comingSoonMsg:“即将推出”, daysRemaining:“天剩余”,
suggestions:[“优先考虑哪个目标？”,“我进展顺利吗？”,“如何更快储蓄？”,“分析我的进度”],
step:“第”, stepOf:“步，共3步”, back:“← 返回”,
planFeatures:{starter:[“1个储蓄目标”,“最高5,000目标”,“基础AI顾问”,“标准提现”],pro:[“5个储蓄目标”,“无限目标”,“高级AI顾问”,“群体储蓄”,“24小时提现”],elite:[“无限目标”,“高级AI顾问”,“无限群组”,“即时提现”,“API访问”],business:[“Elite所有功能”,“团队仪表板”,“多账户管理”,“24/7优先支持”,“自定义账单”]},
upcoming:[{icon:“🔄”,label:“自动转账”,desc:“直接银行连接”},{icon:“🔔”,label:“智能通知”,desc:“个性化提醒”},{icon:“📊”,label:“财富预测”,desc:“可视化模拟”},{icon:“🏆”,label:“里程碑奖励”,desc:“成就与激励”},{icon:“📈”,label:“Pro.G Invest”,desc:“让您的储蓄增值”},{icon:“⚙️”,label:“API访问”,desc:“与您的工具集成”}],
selectLanguage:“选择语言”, languageChanged:“语言已更新”,
nameTaken:“该邮箱已注册账户”, accountNotFound:“未找到该邮箱对应的账户”,
wrongPassword:“密码错误”, accountCreated:“账户创建成功”,
invalidCode:“验证码无效”, errorTryAgain:“错误。请重试。”,
loading:“正在加载您的账户…”, passwordsDontMatch:“两次密码不一致”,
passwordTooShort:“密码太短（至少6位）”, invalidEmailMsg:“无效电子邮件”,
enterName:“请输入您的姓名”, enterPhone:“请输入您的电话号码”,
pinRequired:“请输入4位PIN码”, pinsDontMatch:“两次PIN码不一致”,
enterCodeMsg:“输入邀请码”,
},
wo:{
appTagline:“Sa plateforme ëpp xalis ak jëm.\nSécurisée, professionnelle, bëgg wéy.”,
openAccount:“Ubi konte bi”, signIn:“Dugg ci konte”, welcomeTo:“Dalal ak jàmm ci”,
bankGrade:“Sécurité\nbanke”, aiPowered:“Xam-xam\nIA”, globalCurr:“8+ Xaalis\nbu dëkk”,
personalInfo:“Xibaar yi”, provideDetails:“Bind sa xibaar yi ngir tambali.”,
fullName:“Tur bu am ndigël”, emailAddress:“Aadreesi email”, phone:“Numéro téléphone”,
password:“Mot de passe”, passwordMin:“6 gars ci kanam”, confirmPassword:“Xeer mot de passe”, reEnter:“Bind mot de passe ci kanam”,
hide:“Planqué”, show:“Yëgël”, continue:“Dem ci kanam →”,
alreadyAccount:“Am nga konte?”, noAccount:“Newoon nga ci Pro.G?”,
setPin:“Seet PIN”, choosePIN:“Tànn PIN 4 chiffres ngir sécuriser sa konte.”,
yourPin:“Sa PIN”, confirmPin:“Xeer PIN”,
verifyEmail:“Xeer email”, codeSentTo:“Code 6 chiffres yónnee na ci”,
simulated:“Simulé — sa code bëgg ci notification bi kanam.”,
verificationCode:“Code de vérification”, createAccount:“Samp konte bi”, creating:“Samp konte bi…”,
resendCode:“Yónni code bi”, signingIn:“Dugg…”,
welcomeBack:“Dalal ak jàmm. Dugg sa xibaar yi.”,
forgotPassword:“Bàyyi mot de passe?”, resetPassword:“Seet mot de passe”,
enterEmailReset:“Dugg email bi ngir yónnee link bi.”,
sendResetLink:“Yónni link bi”, sending:“Yónni…”, checkInbox:“Xool sa boite mail”,
resetLinkSent:“Link yónnee na ci”, backToSignIn:“Dellu ci connexion”,
goodDay:“Nanga def,”, totalSavings:“Xaalis bu ëpp”, funded:“FEKKEE”,
goals:“projet yi”, goal:“projet”, target:“Jëm”, activeGoals:“Projet yi nekk”,
personalSavings:“Xaalis bu sa bopp”, groupProjects:“Projet yi ak nawleen”, collaborative:“Ak nawleen”,
ariaAdvisor:“ARIA — Coach IA”, personalizedAnalysis:“Analyse personnalisée défuñu”,
displayCurrency:“Xaalis bu yëgël”,
savingsGoals:“Sa projet yi”, activeGoal:“Projet bu nekk”, activeGoals2:“Projet yi nekk”, noGoalsYet:“Amul projet”,
defineGoal:“Samp sa premier projet ngir tambali.”,
createFirstGoal:“Samp premier projet”, newGoal:”+ Projet bu bees”,
onTrack:“Dem na ci kanam”, atRisk:“⚠ Dafa xarel”, goalAchieved:“✓ Fekkee jëm bi!”, funded2:”% fekkee”,
remaining:“desone”, of:“ci”,
groupSavings:“Ëpp xaalis ak nawleen”, collaborativeGoals:“Projet yu dëkk”,
saveTogether:“Ëpp xaalis ak nawleen ngir jëm bu dëkk.”,
createGroup:”+ Samp groupe”, joinGroup:“🔗 Yógg ci”, noGroupProjects:“Amul projet yi ak nawleen”,
createOrJoin:“Samp groupe walla yógg ak code bi.”,
myShare:“Sama mbind:”, group:“Nawleen”,
professionalAnalysis:“Analyse professionnelle · Tënk yi”,
helloIAmARIA:“Mangi fi, maa ngi ARIA”, ariaDesc:“Sa coach épargne IA. Dama xool sa projet yi, xam xatar yi, di sómmiiku ndimbal yu wér ak chiffres.”,
analyzePortfolio:“✦ Xool sa projet yi”, reanalyze:“↺ Xool ci kanam”, askARIA:“Laaj ARIA…”,
responseLanguage:“Làkk bu tontu”,
account:“Konte”, myAccount:“Sa konte”, totalSaved:“Xaalis bu ëpp”,
plan:“Plan”, signOut:“Génn”,
subscriptionPlans:“Plan yi”, comingSoon:“Dafa ñëw”,
legalCompliance:“Yëgëlug droit”, kycAml:“KYC, AML”,
securityCenter:“Sécurité”, authData:“Authentification”,
helpSupport:“Ndimbal”, faqContact:“FAQ ak contact”,
version:“Version 1.0.0 · © 2025 Pro.G”,
newSavingsGoal:“Projet bu bees”, goalName:“Tur projet”,
goalNamePlaceholder:“xam: Kër, Alal…”,
category:“Catégorie”, currency2:“Xaalis”, targetAmount:“Jëm”, targetDate:“Bés bi”,
createGoal:“Samp projet”, depositAmount:“Bërëb”, confirmDeposit:“Xeer bërëb”,
withdrawalFee:“Frais retrait”, memberContributions:“Mbind yi”,
myDeposit:“Sama bërëb”, inviteMembers:“Yeer nawleen”, invitationCode:“Code invitation”,
copy:“Copy”, invite:“Yeer”, createGroupTitle:“Samp groupe”, joinGroupTitle:“Yógg ci groupe”,
enterCode:“Dugg code bi nawleen bi yónnee.”,
joinGroupBtn:“Yógg”, autoGenCode:“Code bu xam-xam dina samp.”,
groupNamePlaceholder:“xam: Vacation 2026…”,
selectPlan:“Tànn plan bi”, currentPlan:“Plan bi nekk”, planIncludes:“Plan bi ame”,
popular:“BU BARI TÀNNEE”, active:“NEKK”, withdrawalFee2:“Frais retrait”,
processing:“Bëgg…”, deposited:“bërëb na”, copied:“Code copy na!”,
invalidAmount:“Bërëb bu baax”, fillAllFields:“Dëkk dëkk champ yi”,
alreadyMember:“Danga nekk ci”, codeNotFound:“Code amul”,
inviteSent:“Invitation yónnee ci”, invalidEmail:“Email bu baaxul”,
goalCreated:“Projet samp na”, groupCreated:“Groupe samp na — Code:”,
joinedGroup:“Yógg na ci groupe bi”, activated:“activé”,
comingSoonMsg:“Dafa ñëw”, daysRemaining:“fan yi desone”,
suggestions:[“Projet bu nit ko priorité?”,“Dem na ci kanam?”,“Naka ëpp xaalis bu gaaw?”,“Xool sa projet yi”],
step:“Étape”, stepOf:“ci 3”, back:“← Dellu”,
planFeatures:{starter:[“1 projet”,“Jëm max 5000”,“Coach IA basique”,“Retrait 5 fan”],pro:[“5 projet”,“Jëm xam-xam”,“Coach IA avancé”,“Épargne collective”,“Retrait 24h”],elite:[“Projet xam-xam”,“Coach IA premium”,“Groupe xam-xam”,“Retrait instantané”,“API”],business:[“Elite + bari”,“Tableau équipe”,“Multi-compte”,“Support 24/7”,“Facturation perso”]},
upcoming:[{icon:“🔄”,label:“Virements automatiques”,desc:“Connexion banque directe”},{icon:“🔔”,label:“Notifications”,desc:“Alertes personnalisées”},{icon:“📊”,label:“Projections”,desc:“Simulation visuelle”},{icon:“🏆”,label:“Récompenses”,desc:“Défis ak incentives”},{icon:“📈”,label:“Pro.G Invest”,desc:“Ëpp xaalis yi”},{icon:“⚙️”,label:“API”,desc:“Intégration outils”}],
selectLanguage:“Tànn làkk”, languageChanged:“Làkk bi yeesal na”,
nameTaken:“Email bi am konte”, accountNotFound:“Konte amul”,
wrongPassword:“Mot de passe faux”, accountCreated:“Konte samp na”,
invalidCode:“Code faux”, errorTryAgain:“Sàkket. Saytu.”,
loading:“Jëmm konte bi…”, passwordsDontMatch:“Mot de passe yiñu bokk”,
passwordTooShort:“Mot de passe dëkk (6 min)”, invalidEmailMsg:“Email bu baaxul”,
enterName:“Dugg sa tur”, enterPhone:“Dugg sa numéro”,
pinRequired:“Dugg PIN 4 chiffres”, pinsDontMatch:“PIN yi bokkul”,
enterCodeMsg:“Dugg code”,
},
ha:{appTagline:“Dandamali naka ajiyar ku mai wayo.\nAminci, ƙwararru, don girma.”,
openAccount:“Buɗe asusun”, signIn:“Shiga”, welcomeTo:“Barka da zuwa”,
bankGrade:“Tsaron\nbanki”, aiPowered:“Shawarar\nAI”, globalCurr:“8+ Kuɗaɗe\nna duniya”,
personalInfo:“Bayanan sirri”, provideDetails:“Da fatan za a ba da bayananku.”,
fullName:“Cikakken suna”, emailAddress:“Adireshin imel”, phone:“Lambar waya”,
password:“Kalmar sirri”, passwordMin:“Haruffa 6 aƙalla”, confirmPassword:“Tabbatar da kalmar sirri”, reEnter:“Sake shigar da kalmar sirri”,
hide:“Boye”, show:“Nuna”, continue:“Ci gaba →”,
alreadyAccount:“Kuna da asusun?”, noAccount:“Sabon Pro.G?”,
setPin:“Saita PIN”, choosePIN:“Zaɓi PIN mai lamba 4 don kare asusunka.”,
yourPin:“PINka”, confirmPin:“Tabbatar da PIN”,
verifyEmail:“Tabbatar da imel”, codeSentTo:“An aika lamba 6 zuwa”,
simulated:“Kwaikwayo — koden ku yana a sanarwar da ke sama.”,
verificationCode:“Lambar tabbatarwa”, createAccount:“Ƙirƙiri asusun”, creating:“Ana ƙirƙirar asusunka…”,
resendCode:“Sake aika lamba”, signingIn:“Ana shiga…”,
welcomeBack:“Barka da dawowa. Shigar da bayananku.”,
forgotPassword:“Manta kalmar sirri?”, resetPassword:“Sake saita kalmar sirri”,
enterEmailReset:“Shigar da imelku don karɓar hanyar sake saita.”,
sendResetLink:“Aika hanyar”, sending:“Ana aika…”, checkInbox:“Duba akwatin wasiƙa”,
resetLinkSent:“An aika hanya zuwa”, backToSignIn:“Koma shiga”,
goodDay:“Ina kwana,”, totalSavings:“Jimlar ajiyar”, funded:“AN CIMMA”,
goals:“manufofi”, goal:“manufa”, target:“Manufa”, activeGoals:“Manufofi masu aiki”,
personalSavings:“Ajiyar sirri”, groupProjects:“Ayyukan ƙungiya”, collaborative:“Haɗin gwiwa”,
ariaAdvisor:“ARIA — Mai ba da shawara AI”, personalizedAnalysis:“Nazari na musamman yana akwai”,
displayCurrency:“Nuna kuɗi”,
savingsGoals:“Manufofina”, activeGoal:“Manufa mai aiki”, activeGoals2:“Manufofi masu aiki”, noGoalsYet:“Babu manufofi tukuna”,
defineGoal:“Ƙirƙiri manufa ta farkon ajiyarku.”,
createFirstGoal:“Ƙirƙiri manufa ta farko”, newGoal:”+ Sabuwar manufa”,
onTrack:“A kan hanya”, atRisk:“⚠ Cikin haɗari”, goalAchieved:“✓ An cimma manufa!”, funded2:”% an cimma”,
remaining:“saura”, of:“daga”,
groupSavings:“Ajiyar ƙungiya”, collaborativeGoals:“Manufofi na gama-gari”,
saveTogether:“Yi ajiya tare zuwa ga manufa ta gama-gari.”,
createGroup:”+ Ƙirƙiri ƙungiya”, joinGroup:“🔗 Shiga”, noGroupProjects:“Babu ayyukan ƙungiya”,
createOrJoin:“Ƙirƙiri ƙungiya ko shiga ta lambar gayyata.”,
myShare:“Rabona:”, group:“Ƙungiya”,
professionalAnalysis:“Nazari na ƙwararru · Shawarwari masu amfani”,
helloIAmARIA:“Sannu, ni ARIA ne”, ariaDesc:“Mai ba da shawara ta kuɗi AI. Ina nazarin manufofin ajiyarku kuma ina ba da shawarwari.”,
analyzePortfolio:“✦ Nazari manufofina”, reanalyze:“↺ Sake nazari”, askARIA:“Tambayi ARIA…”,
responseLanguage:“Yaren amsa”,
account:“Asusun”, myAccount:“Asusuna”, totalSaved:“Jimlar ajiya”,
plan:“Tsari”, signOut:“Fita”,
subscriptionPlans:“Tsarukan biyan kuɗi”, comingSoon:“Nan ba da daɗewa”,
legalCompliance:“Bin doka”, kycAml:“KYC, AML”,
securityCenter:“Cibiyar tsaro”, authData:“Tabbatarwa & kariyar bayanai”,
helpSupport:“Taimako & Tallafi”, faqContact:“FAQ da tuntuɓar mu”,
version:“Sigar 1.0.0 · © 2025 Pro.G”,
newSavingsGoal:“Sabuwar manufa ta ajiya”, goalName:“Sunan manufa”,
goalNamePlaceholder:“misali: Biyan gida, Asusun gaggawa…”,
category:“Rukuni”, currency2:“Kuɗi”, targetAmount:“Adadin manufa”, targetDate:“Ranar ƙarshe”,
createGoal:“Ƙirƙiri manufa”, depositAmount:“Adadin ajiya”, confirmDeposit:“Tabbatar da ajiya”,
withdrawalFee:“Kuɗin fitar da”, memberContributions:“Gudummawar mambobi”,
myDeposit:“Ajiyata”, inviteMembers:“Gayyatar mambobi”, invitationCode:“Lambar gayyata”,
copy:“Kwafi”, invite:“Gayyata”, createGroupTitle:“Ƙirƙiri ƙungiya”, joinGroupTitle:“Shiga ƙungiya”,
enterCode:“Shigar da lambar da shugaban ƙungiyar ya raba.”,
joinGroupBtn:“Shiga”, autoGenCode:“Za a ƙirƙiri lambar musamman ta atomatik.”,
groupNamePlaceholder:“misali: Hutu na iyali 2026…”,
selectPlan:“Zaɓi wannan tsarin”, currentPlan:“Wannan shine tsarinku na yanzu”, planIncludes:“Tsarin ya haɗa”,
popular:“MAFI SHAHARA”, active:“AIKI”, withdrawalFee2:“Kuɗin fitar”,
processing:“Ana sarrafa…”, deposited:“an ajiye”, copied:“An kwafi lambar!”,
invalidAmount:“Adadi mara inganci”, fillAllFields:“Da fatan za a cike duk filayen”,
alreadyMember:“Kun riga kun kasance mamba”, codeNotFound:“Ba a sami lambar ba”,
inviteSent:“An aika gayyata zuwa”, invalidEmail:“Imel mara inganci”,
goalCreated:“An ƙirƙiri manufa”, groupCreated:“An ƙirƙiri ƙungiya — Lambar:”,
joinedGroup:“An shiga ƙungiyar”, activated:“an kunna”,
comingSoonMsg:“Nan ba da daɗewa”, daysRemaining:“kwanaki saura”,
suggestions:[“Wace manufa ta fi muhimmanci?”,“Ina kan hanya?”,“Yadda ake ajiya da sauri?”,“Nazarin ci gabana”],
step:“Matakin”, stepOf:“na 3”, back:“← Koma”,
planFeatures:{starter:[“Manufa 1”,“Har $5,000”,“Mai ba da shawara AI”,“Fitar da kuɗi standard”],pro:[“Manufofi 5”,“Manufa ba iyaka”,“AI mai ci gaba”,“Ajiyar ƙungiya”,“Fitar 24h”],elite:[“Manufofi ba iyaka”,“AI premium”,“Ƙungiyoyi ba iyaka”,“Fitar da nan take”,“API”],business:[“Duk Elite”,“Dashboard tawagar”,“Multi-asusun”,“Tallafi 24/7”,“Lissafin musamman”]},
upcoming:[{icon:“🔄”,label:“Canja wurin atomatik”,desc:“Haɗin banki kai tsaye”},{icon:“🔔”,label:“Sanarwa masu wayo”,desc:“Faɗakarwa na sirri”},{icon:“📊”,label:“Hasashen dukiya”,desc:“Kwaikwayon gani”},{icon:“🏆”,label:“Kyaututtuka”,desc:“Nasarori da ƙarfafawa”},{icon:“📈”,label:“Pro.G Invest”,desc:“Girma ajiyar ku”},{icon:“⚙️”,label:“Samun API”,desc:“Haɗawa da kayan aikinku”}],
selectLanguage:“Zaɓi harshe”, languageChanged:“An sabunta harshe”,
nameTaken:“Akwai asusun da wannan imel”, accountNotFound:“Ba a sami asusun ba”,
wrongPassword:“Kalmar sirri ba daidai ba”, accountCreated:“An ƙirƙiri asusun”,
invalidCode:“Lambar ba daidai ba”, errorTryAgain:“Kuskure. Sake gwadawa.”,
loading:“Ana loda asusunka…”, passwordsDontMatch:“Kalmomin sirri ba su dace ba”,
passwordTooShort:“Kalmar sirri gajere (6 aƙalla)”, invalidEmailMsg:“Imel mara inganci”,
enterName:“Shigar da sunanka”, enterPhone:“Shigar da lambar wayarka”,
pinRequired:“Shigar da PIN 4”, pinsDontMatch:“PIN ba su dace ba”,
enterCodeMsg:“Shigar da lambar”,
},
sw:{appTagline:“Jukwaa lako la akiba la akili.\nSalama, kitaalamu, na lililoundwa kukua.”,
openAccount:“Fungua akaunti”, signIn:“Ingia”, welcomeTo:“Karibu”,
bankGrade:“Usalama\nwa benki”, aiPowered:“Ushauri\nwa AI”, globalCurr:“Sarafu 8+\nza ulimwengu”,
personalInfo:“Taarifa za kibinafsi”, provideDetails:“Tafadhali toa maelezo yako kuanza.”,
fullName:“Jina kamili”, emailAddress:“Anwani ya barua pepe”, phone:“Nambari ya simu”,
password:“Nenosiri”, passwordMin:“Angalau herufi 6”, confirmPassword:“Thibitisha nenosiri”, reEnter:“Ingiza tena nenosiri”,
hide:“Ficha”, show:“Onyesha”, continue:“Endelea →”,
alreadyAccount:“Una akaunti tayari?”, noAccount:“Mpya kwenye Pro.G?”,
setPin:“Weka PIN”, choosePIN:“Chagua PIN ya tarakimu 4 kulinda akaunti yako.”,
yourPin:“PIN yako”, confirmPin:“Thibitisha PIN”,
verifyEmail:“Thibitisha barua pepe”, codeSentTo:“Nambari ya tarakimu 6 imetumwa kwa”,
simulated:“Mfano — nambari yako inaonekana kwenye arifa hapo juu.”,
verificationCode:“Nambari ya uthibitisho”, createAccount:“Unda akaunti”, creating:“Inaunda akaunti yako…”,
resendCode:“Tuma tena nambari”, signingIn:“Inaingia…”,
welcomeBack:“Karibu tena. Ingiza vitambulisho vyako.”,
forgotPassword:“Umesahau nenosiri?”, resetPassword:“Weka upya nenosiri”,
enterEmailReset:“Ingiza barua pepe yako kupokea kiungo cha kuweka upya.”,
sendResetLink:“Tuma kiungo”, sending:“Inatuma…”, checkInbox:“Angalia kikasha chako”,
resetLinkSent:“Kiungo kimetumwa kwa”, backToSignIn:“Rudi kuingia”,
goodDay:“Habari,”, totalSavings:“Jumla ya akiba”, funded:“IMEFIKIWA”,
goals:“malengo”, goal:“lengo”, target:“Lengo”, activeGoals:“Malengo hai”,
personalSavings:“Akiba ya kibinafsi”, groupProjects:“Miradi ya kikundi”, collaborative:“Ushirikiano”,
ariaAdvisor:“ARIA — Mshauri wa AI”, personalizedAnalysis:“Uchambuzi wa kibinafsi unapatikana”,
displayCurrency:“Sarafu ya kuonyesha”,
savingsGoals:“Malengo yangu”, activeGoal:“Lengo hai”, activeGoals2:“Malengo hai”, noGoalsYet:“Hakuna malengo bado”,
defineGoal:“Weka lengo lako la kwanza la akiba.”,
createFirstGoal:“Unda lengo langu la kwanza”, newGoal:”+ Lengo jipya”,
onTrack:“Kwenye njia”, atRisk:“⚠ Katika hatari”, goalAchieved:“✓ Lengo limefikiwa!”, funded2:”% imefikiwa”,
remaining:“iliyobaki”, of:“kati ya”,
groupSavings:“Akiba ya kikundi”, collaborativeGoals:“Malengo ya pamoja”,
saveTogether:“Okoa pamoja kuelekea lengo la pamoja la kifedha.”,
createGroup:”+ Unda kikundi”, joinGroup:“🔗 Jiunge”, noGroupProjects:“Hakuna miradi ya kikundi”,
createOrJoin:“Unda kikundi au jiunge kwa nambari ya mwaliko.”,
myShare:“Sehemu yangu:”, group:“Kikundi”,
professionalAnalysis:“Uchambuzi wa kitaalamu · Mapendekezo ya vitendo”,
helloIAmARIA:“Habari, mimi ni ARIA”, ariaDesc:“Mshauri wako wa fedha wa AI. Ninachambua akiba yako na kutoa mapendekezo ya kibinafsi.”,
analyzePortfolio:“✦ Chambua akiba yangu”, reanalyze:“↺ Chambua tena”, askARIA:“Uliza ARIA…”,
responseLanguage:“Lugha ya majibu”,
account:“Akaunti”, myAccount:“Akaunti yangu”, totalSaved:“Jumla iliyookolewa”,
plan:“Mpango”, signOut:“Toka”,
subscriptionPlans:“Mipango ya usajili”, comingSoon:“Inakuja hivi karibuni”,
legalCompliance:“Uzingatiaji wa kisheria”, kycAml:“KYC, AML”,
securityCenter:“Kituo cha usalama”, authData:“Uthibitisho na ulinzi wa data”,
helpSupport:“Msaada na Usaidizi”, faqContact:“Maswali na mawasiliano”,
version:“Toleo 1.0.0 · © 2025 Pro.G”,
newSavingsGoal:“Lengo jipya la akiba”, goalName:“Jina la lengo”,
goalNamePlaceholder:“mf: Malipo ya awali, Akiba ya dharura…”,
category:“Kategoria”, currency2:“Sarafu”, targetAmount:“Kiasi kinacholenga”, targetDate:“Tarehe ya mwisho”,
createGoal:“Unda lengo”, depositAmount:“Kiasi cha amana”, confirmDeposit:“Thibitisha amana”,
withdrawalFee:“Ada ya kutoa”, memberContributions:“Michango ya wanachama”,
myDeposit:“Amana yangu”, inviteMembers:“Mwalika wanachama”, invitationCode:“Nambari ya mwaliko”,
copy:“Nakili”, invite:“Mwalika”, createGroupTitle:“Unda kikundi”, joinGroupTitle:“Jiunge na kikundi”,
enterCode:“Ingiza nambari iliyoshirikiwa na muundaji wa kikundi.”,
joinGroupBtn:“Jiunge”, autoGenCode:“Nambari ya kipekee itatengenezwa kiotomatiki.”,
groupNamePlaceholder:“mf: Likizo ya familia 2026…”,
selectPlan:“Chagua mpango huu”, currentPlan:“Huu ndio mpango wako wa sasa”, planIncludes:“Mpango unajumuisha”,
popular:“MAARUFU ZAIDI”, active:“HAI”, withdrawalFee2:“Ada ya kutoa”,
processing:“Inashughulikia…”, deposited:“imeaminiwa”, copied:“Nambari imenakiliwa!”,
invalidAmount:“Kiasi batili”, fillAllFields:“Tafadhali jaza sehemu zote”,
alreadyMember:“Tayari wewe ni mwanachama”, codeNotFound:“Nambari haikupatikana”,
inviteSent:“Mwaliko umetumwa kwa”, invalidEmail:“Barua pepe batili”,
goalCreated:“Lengo limeundwa”, groupCreated:“Kikundi kimeundwa — Nambari:”,
joinedGroup:“Umejiunga na kikundi”, activated:“imeamilishwa”,
comingSoonMsg:“Inakuja hivi karibuni”, daysRemaining:“siku zilizobaki”,
suggestions:[“Lengo gani la kipaumbele?”,“Niko kwenye njia?”,“Jinsi ya kuokoa haraka?”,“Chambua maendeleo yangu”],
step:“Hatua”, stepOf:“kati ya 3”, back:“← Rudi”,
planFeatures:{starter:[“Lengo 1”,“Hadi $5,000”,“Mshauri AI wa msingi”,“Uondoaji wa kawaida”],pro:[“Malengo 5”,“Lengo bila kikomo”,“Mshauri AI wa juu”,“Akiba ya kikundi”,“Uondoaji 24h”],elite:[“Malengo bila kikomo”,“Mshauri AI bora”,“Vikundi bila kikomo”,“Uondoaji wa papo hapo”,“Ufikiaji wa API”],business:[“Kila kitu katika Elite”,“Dashibodi ya timu”,“Usimamizi wa akaunti nyingi”,“Usaidizi 24/7”,“Bili ya kibinafsi”]},
upcoming:[{icon:“🔄”,label:“Uhamishaji wa kiotomatiki”,desc:“Muunganisho wa moja kwa moja na benki”},{icon:“🔔”,label:“Arifa za akili”,desc:“Tahadhari na vikumbusho vya kibinafsi”},{icon:“📊”,label:“Makadirio ya utajiri”,desc:“Mfano wa kuona”},{icon:“🏆”,label:“Tuzo za hatua”,desc:“Mafanikio na motisha”},{icon:“📈”,label:“Pro.G Invest”,desc:“Kukuza akiba yako”},{icon:“⚙️”,label:“Ufikiaji wa API”,desc:“Unganisha na zana zako”}],
selectLanguage:“Chagua lugha”, languageChanged:“Lugha imesasishwa”,
nameTaken:“Akaunti ipo tayari na barua pepe hii”, accountNotFound:“Hakuna akaunti iliyopatikana”,
wrongPassword:“Nenosiri si sahihi”, accountCreated:“Akaunti imeundwa”,
invalidCode:“Nambari batili”, errorTryAgain:“Hitilafu. Jaribu tena.”,
loading:“Inapakia akaunti yako…”, passwordsDontMatch:“Manenosiri hayalingani”,
passwordTooShort:“Nenosiri fupi sana (angalau 6)”, invalidEmailMsg:“Barua pepe batili”,
enterName:“Ingiza jina lako”, enterPhone:“Ingiza nambari yako ya simu”,
pinRequired:“Ingiza PIN ya tarakimu 4”, pinsDontMatch:“PIN hazilingani”,
enterCodeMsg:“Ingiza nambari”,
},
it:{appTagline:“La tua piattaforma di risparmio intelligente.\nSicura, professionale e pensata per crescere.”,
openAccount:“Apri un conto”, signIn:“Accedi”, welcomeTo:“Benvenuto su”,
bankGrade:“Sicurezza\nbancaria”, aiPowered:“Consulenza\ncon AI”, globalCurr:“8+ valute\nglobali”,
personalInfo:“Informazioni personali”, provideDetails:“Inserisci i tuoi dati per iniziare.”,
fullName:“Nome completo”, emailAddress:“Indirizzo email”, phone:“Numero di telefono”,
password:“Password”, passwordMin:“Minimo 6 caratteri”, confirmPassword:“Conferma password”, reEnter:“Reinserisci la password”,
hide:“Nascondi”, show:“Mostra”, continue:“Continua →”,
alreadyAccount:“Hai già un account?”, noAccount:“Nuovo su Pro.G?”,
setPin:“Imposta PIN”, choosePIN:“Scegli un PIN di 4 cifre per proteggere il tuo account.”,
yourPin:“Il tuo PIN”, confirmPin:“Conferma PIN”,
verifyEmail:“Verifica email”, codeSentTo:“Un codice a 6 cifre è stato inviato a”,
simulated:“Simulato — il tuo codice appare nella notifica in alto.”,
verificationCode:“Codice di verifica”, createAccount:“Crea account”, creating:“Creazione account in corso…”,
resendCode:“Invia di nuovo il codice”, signingIn:“Accesso in corso…”,
welcomeBack:“Bentornato. Inserisci le tue credenziali.”,
forgotPassword:“Password dimenticata?”, resetPassword:“Reimposta password”,
enterEmailReset:“Inserisci la tua email per ricevere un link di reimpostazione.”,
sendResetLink:“Invia link”, sending:“Invio…”, checkInbox:“Controlla la tua casella di posta”,
resetLinkSent:“Un link è stato inviato a”, backToSignIn:“Torna all’accesso”,
goodDay:“Buongiorno,”, totalSavings:“Portafoglio di risparmio totale”, funded:“FINANZIATO”,
goals:“obiettivi”, goal:“obiettivo”, target:“Obiettivo”, activeGoals:“Obiettivi attivi”,
personalSavings:“Risparmio personale”, groupProjects:“Progetti di gruppo”, collaborative:“Collaborativo”,
ariaAdvisor:“ARIA — Consulente AI”, personalizedAnalysis:“Analisi personalizzata disponibile”,
displayCurrency:“Valuta visualizzata”,
savingsGoals:“I miei obiettivi”, activeGoal:“Obiettivo attivo”, activeGoals2:“Obiettivi attivi”, noGoalsYet:“Nessun obiettivo ancora”,
defineGoal:“Definisci il tuo primo obiettivo di risparmio.”,
createFirstGoal:“Crea il mio primo obiettivo”, newGoal:”+ Nuovo obiettivo”,
onTrack:“In linea”, atRisk:“⚠ A rischio”, goalAchieved:“✓ Obiettivo raggiunto!”, funded2:”% finanziato”,
remaining:“rimanente”, of:“di”,
groupSavings:“Risparmio di gruppo”, collaborativeGoals:“Obiettivi condivisi”,
saveTogether:“Risparmiate insieme verso un obiettivo finanziario comune.”,
createGroup:”+ Crea gruppo”, joinGroup:“🔗 Unisciti”, noGroupProjects:“Nessun progetto di gruppo”,
createOrJoin:“Crea un gruppo o unisciti con un codice.”,
myShare:“La mia quota:”, group:“Gruppo”,
professionalAnalysis:“Analisi professionale · Raccomandazioni concrete”,
helloIAmARIA:“Ciao, sono ARIA”, ariaDesc:“La tua consulente finanziaria AI. Analizzo il tuo portafoglio e fornisco raccomandazioni personalizzate.”,
analyzePortfolio:“✦ Analizza il mio portafoglio”, reanalyze:“↺ Rianalizzi”, askARIA:“Chiedi ad ARIA…”,
responseLanguage:“Lingua di risposta”,
account:“Account”, myAccount:“Il mio account”, totalSaved:“Totale risparmiato”,
plan:“Piano”, signOut:“Disconnetti”,
subscriptionPlans:“Piani di abbonamento”, comingSoon:“Prossimamente”,
legalCompliance:“Conformità legale”, kycAml:“KYC, AML, Normativa”,
securityCenter:“Centro sicurezza”, authData:“Autenticazione & dati”,
helpSupport:“Aiuto & Supporto”, faqContact:“FAQ, guide e contatti”,
version:“Versione 1.0.0 · © 2025 Pro.G · Tutti i diritti riservati”,
newSavingsGoal:“Nuovo obiettivo di risparmio”, goalName:“Nome obiettivo”,
goalNamePlaceholder:“es: Acconto casa, Fondo emergenza…”,
category:“Categoria”, currency2:“Valuta”, targetAmount:“Importo obiettivo”, targetDate:“Data obiettivo”,
createGoal:“Crea obiettivo”, depositAmount:“Importo deposito”, confirmDeposit:“Conferma deposito”,
withdrawalFee:“Commissione prelievo”, memberContributions:“Contributi dei membri”,
myDeposit:“Il mio deposito”, inviteMembers:“Invita membri”, invitationCode:“Codice invito”,
copy:“Copia”, invite:“Invita”, createGroupTitle:“Crea gruppo”, joinGroupTitle:“Unisciti a un gruppo”,
enterCode:“Inserisci il codice condiviso dal creatore del gruppo.”,
joinGroupBtn:“Unisciti”, autoGenCode:“Verrà generato automaticamente un codice univoco.”,
groupNamePlaceholder:“es: Vacanza famiglia 2026…”,
selectPlan:“Seleziona piano”, currentPlan:“Questo è il tuo piano attuale”, planIncludes:“Il piano include”,
popular:“PIÙ POPOLARE”, active:“ATTIVO”, withdrawalFee2:“Commissione prelievo”,
processing:“Elaborazione…”, deposited:“depositato”, copied:“Codice copiato!”,
invalidAmount:“Importo non valido”, fillAllFields:“Compila tutti i campi”,
alreadyMember:“Sei già un membro”, codeNotFound:“Codice non trovato”,
inviteSent:“Invito inviato a”, invalidEmail:“Email non valida”,
goalCreated:“Obiettivo creato con successo”, groupCreated:“Gruppo creato — Codice:”,
joinedGroup:“Ti sei unito al gruppo con successo”, activated:“attivato”,
comingSoonMsg:“Prossimamente”, daysRemaining:“giorni rimanenti”,
suggestions:[“Quale obiettivo priorizzare?”,“Sono in linea?”,“Come risparmiare più velocemente?”,“Analizza i miei progressi”],
step:“Passaggio”, stepOf:“di 3”, back:“← Indietro”,
planFeatures:{starter:[“1 obiettivo di risparmio”,“Fino a $5.000”,“Consulente AI base”,“Prelievo standard”],pro:[“5 obiettivi”,“Obiettivo illimitato”,“Consulente AI avanzato”,“Risparmio di gruppo”,“Prelievo 24h”],elite:[“Obiettivi illimitati”,“Consulente AI premium”,“Gruppi illimitati”,“Prelievo istantaneo”,“Accesso API”],business:[“Tutto in Elite”,“Dashboard team”,“Multi-account”,“Supporto 24/7”,“Fatturazione personalizzata”]},
upcoming:[{icon:“🔄”,label:“Bonifici automatici”,desc:“Connessione bancaria diretta”},{icon:“🔔”,label:“Notifiche intelligenti”,desc:“Avvisi e promemoria personalizzati”},{icon:“📊”,label:“Proiezioni patrimoniali”,desc:“Simulazioni visive”},{icon:“🏆”,label:“Premi per traguardi”,desc:“Obiettivi e incentivi”},{icon:“📈”,label:“Pro.G Invest”,desc:“Fai crescere i tuoi risparmi”},{icon:“⚙️”,label:“Accesso API”,desc:“Integra con i tuoi strumenti”}],
selectLanguage:“Seleziona lingua”, languageChanged:“Lingua aggiornata”,
nameTaken:“Esiste già un account con questa email”, accountNotFound:“Nessun account trovato”,
wrongPassword:“Password errata”, accountCreated:“Account creato con successo”,
invalidCode:“Codice non valido”, errorTryAgain:“Errore. Riprova.”,
loading:“Caricamento del tuo account…”, passwordsDontMatch:“Le password non coincidono”,
passwordTooShort:“Password troppo corta (min. 6)”, invalidEmailMsg:“Email non valida”,
enterName:“Inserisci il tuo nome”, enterPhone:“Inserisci il tuo numero di telefono”,
pinRequired:“Inserisci un PIN di 4 cifre”, pinsDontMatch:“I PIN non coincidono”,
enterCodeMsg:“Inserisci un codice”,
},
};

// Fallback to English for missing keys
const getLang = code => {
const t = T[code] || T.en;
return new Proxy(t, { get: (target, key) => target[key] !== undefined ? target[key] : (T.en[key] || key) });
};

const detectBrowserLang = () => {
const nav = (navigator.language || navigator.userLanguage || “en”).split(”-”)[0].toLowerCase();
return LANGS.find(l => l.code === nav)?.code || “en”;
};

// ─── LANG CONTEXT ─────────────────────────────────────────────────
const LangCtx = createContext({lang:“en”, t:T.en, setLang:()=>{}});
const useLang = () => useContext(LangCtx);

// ─── CONSTANTS ────────────────────────────────────────────────────
const CURRENCIES=[{code:“EUR”,symbol:“€”,flag:“🇪🇺”},{code:“USD”,symbol:”$”,flag:“🇺🇸”},{code:“GBP”,symbol:“£”,flag:“🇬🇧”},{code:“XOF”,symbol:“FCFA”,flag:“🌍”},{code:“MAD”,symbol:“DH”,flag:“🇲🇦”},{code:“CAD”,symbol:“CA$”,flag:“🇨🇦”},{code:“NGN”,symbol:“₦”,flag:“🇳🇬”},{code:“GHS”,symbol:“₵”,flag:“🇬🇭”}];
const CATEGORIES=[{id:“home”,icon:“🏠”},{id:“travel”,icon:“✈️”},{id:“education”,icon:“🎓”},{id:“business”,icon:“💼”},{id:“wedding”,icon:“💍”},{id:“car”,icon:“🚗”},{id:“health”,icon:“🏥”},{id:“other”,icon:“⭐”}];
const CAT_LABELS={en:[“Real Estate”,“Travel”,“Education”,“Business”,“Wedding”,“Vehicle”,“Healthcare”,“Other”],fr:[“Maison”,“Voyage”,“Études”,“Business”,“Mariage”,“Voiture”,“Santé”,“Autre”],es:[“Bienes raíces”,“Viaje”,“Educación”,“Negocio”,“Boda”,“Vehículo”,“Salud”,“Otro”],ar:[“عقارات”,“سفر”,“تعليم”,“أعمال”,“زواج”,“مركبة”,“رعاية صحية”,“أخرى”],pt:[“Imóveis”,“Viagem”,“Educação”,“Negócio”,“Casamento”,“Veículo”,“Saúde”,“Outro”],de:[“Immobilien”,“Reise”,“Bildung”,“Geschäft”,“Hochzeit”,“Fahrzeug”,“Gesundheit”,“Sonstiges”],zh:[“房产”,“旅行”,“教育”,“商业”,“婚礼”,“车辆”,“医疗”,“其他”],wo:[“Kër”,“Safar”,“Jàng”,“Liggéey”,“Mariag”,“Oto”,“Yaram”,“Yeneen”],ha:[“Gidaje”,“Tafiya”,“Ilimi”,“Kasuwanci”,“Aure”,“Ababen hawa”,“Kiwon lafiya”,“Wasu”],sw:[“Nyumba”,“Safari”,“Elimu”,“Biashara”,“Harusi”,“Gari”,“Afya”,“Nyingine”],it:[“Immobili”,“Viaggio”,“Istruzione”,“Affari”,“Matrimonio”,“Veicolo”,“Salute”,“Altro”]};
const PLANS=[{id:“starter”,name:“Essential”,fee:“2.5%”,color:”#64748B”,withdrawal:“5 days”},{id:“pro”,name:“Professional”,fee:“1.5%”,color:”#1E3A5F”,popular:true,withdrawal:“24h”},{id:“elite”,name:“Elite”,fee:“0.8%”,color:”#0F766E”,withdrawal:“Instant”},{id:“business”,name:“Enterprise”,fee:“0.3%”,color:”#92400E”,withdrawal:“Instant”}];
const PLAN_PRICES=[“Free”,”$4.99/mo”,”$12.99/mo”,”$29.99/mo”];

const NAVY=”#0A1628”,NAVY2=”#1E3A5F”,GOLD=”#C9A84C”,GOLD2=”#E8C97A”,SLATE=”#64748B”,LIGHT=”#F8FAFC”,WHITE=”#FFFFFF”,BORDER=”#E2E8F0”,TEXT=”#0F172A”,MUTED=”#94A3B8”;

const getCur=c=>CURRENCIES.find(x=>x.code===c)||CURRENCIES[0];
const getCat=(c,lang)=>{const i=CATEGORIES.findIndex(x=>x.id===c);const labels=CAT_LABELS[lang]||CAT_LABELS.en;return{…CATEGORIES[i>=0?i:0],label:labels[i>=0?i:0]};};
const getPlan=id=>PLANS.find(p=>p.id===id)||PLANS[0];
const genCode=()=>Math.random().toString(36).substring(2,8).toUpperCase();
const hashStr=async s=>{const buf=await crypto.subtle.digest(“SHA-256”,new TextEncoder().encode(s));return Array.from(new Uint8Array(buf)).map(b=>b.toString(16).padStart(2,“0”)).join(””);};

const CSS=`@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700;800&family=Inter:wght@300;400;500;600;700&display=swap'); *{box-sizing:border-box;margin:0;padding:0;} body{background:${LIGHT};} @keyframes up{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:translateY(0)}} @keyframes toast{0%{opacity:0;transform:translateY(-12px)}10%,85%{opacity:1;transform:translateY(0)}100%{opacity:0}} @keyframes blink{0%,100%{opacity:1}50%{opacity:0}} @keyframes fadeIn{from{opacity:0;transform:translateY(6px)}to{opacity:1;transform:translateY(0)}} @keyframes pulse{0%,100%{opacity:.5}50%{opacity:1}} input,select,button,textarea{font-family:'Inter',sans-serif;} .fade{animation:up .4s cubic-bezier(.22,1,.36,1) both;} .card{background:${WHITE};border-radius:16px;border:1px solid ${BORDER};padding:24px;animation:up .4s cubic-bezier(.22,1,.36,1) both;box-shadow:0 1px 3px rgba(0,0,0,.06);} .btn-p{border:none;border-radius:10px;cursor:pointer;font-weight:600;font-size:14px;padding:14px 24px;background:${NAVY};color:${WHITE};transition:all .2s;} .btn-s{border:1.5px solid ${BORDER};border-radius:10px;cursor:pointer;font-weight:600;font-size:14px;padding:14px 24px;background:${WHITE};color:${TEXT};transition:all .2s;} .inp{width:100%;border:1.5px solid ${BORDER};border-radius:10px;padding:13px 16px;font-size:14px;background:${WHITE};color:${TEXT};outline:none;transition:all .2s;} .inp:focus{border-color:${NAVY2};box-shadow:0 0 0 3px rgba(30,58,95,.08);} .inp::placeholder{color:${MUTED};} .overlay{position:fixed;inset:0;background:rgba(10,22,40,.6);backdrop-filter:blur(8px);z-index:200;display:flex;align-items:flex-end;} .sheet{background:${WHITE};border-radius:24px 24px 0 0;width:100%;padding:28px 24px 44px;max-height:92vh;overflow-y:auto;} .tab-bar{position:fixed;bottom:0;left:0;right:0;background:${WHITE};border-top:1px solid ${BORDER};display:flex;padding:10px 0 20px;z-index:100;} .tab-item{flex:1;display:flex;flex-direction:column;align-items:center;gap:4px;cursor:pointer;border:none;background:none;font-size:9px;font-weight:600;color:${MUTED};letter-spacing:.4px;text-transform:uppercase;padding:4px 0;transition:color .2s;font-family:'Inter',sans-serif;} .tab-item.active{color:${NAVY};} .tab-icon{font-size:16px;transition:transform .2s;} .tab-item.active .tab-icon{transform:scale(1.2);} .prog-track{height:5px;background:${BORDER};border-radius:99px;overflow:hidden;} .prog-fill{height:100%;border-radius:99px;background:linear-gradient(90deg,${NAVY2},${GOLD});transition:width .9s cubic-bezier(.22,1,.36,1);} .prog-fill.done{background:linear-gradient(90deg,#0F766E,#14B8A6);} .cat-btn{border:1.5px solid ${BORDER};border-radius:8px;padding:8px 12px;background:${WHITE};cursor:pointer;font-size:12px;font-weight:500;color:${SLATE};transition:all .15s;white-space:nowrap;} .cat-btn.active{border-color:${NAVY};background:${NAVY};color:${WHITE};} .dot{width:6px;height:6px;border-radius:50%;background:${NAVY};animation:blink 1s ease infinite;} .dot:nth-child(2){animation-delay:.2s}.dot:nth-child(3){animation-delay:.4s} .sugg{border:1px solid ${BORDER};background:${WHITE};border-radius:20px;padding:7px 14px;font-size:12px;font-weight:500;color:${SLATE};cursor:pointer;white-space:nowrap;} .sugg:hover{border-color:${NAVY};color:${NAVY};} .pin-box{width:54px;height:62px;border:2px solid ${BORDER};border-radius:12px;font-size:22px;font-weight:700;text-align:center;background:${LIGHT};color:${TEXT};outline:none;transition:border .15s;font-family:'Inter',sans-serif;} .pin-box:focus{border-color:${NAVY2};background:${WHITE};} ::-webkit-scrollbar{width:0;}`;

function Toast({toast}){if(!toast)return null;return <div style={{position:“fixed”,top:20,left:“50%”,transform:“translateX(-50%)”,background:toast.type===“err”?”#DC2626”:NAVY,color:WHITE,padding:“12px 24px”,borderRadius:10,fontWeight:600,fontSize:13,zIndex:999,animation:“toast 3s ease forwards”,whiteSpace:“nowrap”,boxShadow:“0 8px 32px rgba(0,0,0,.2)”}}>{toast.msg}</div>;}
function Lbl({children,dir}){return <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:“uppercase”,marginBottom:8,fontFamily:“Inter,sans-serif”,textAlign:dir===“rtl”?“right”:“left”}}>{children}</p>;}

// ─── LANG PICKER SCREEN ───────────────────────────────────────────
function LangPicker({onSelect}){
return(
<div style={{minHeight:“100vh”,background:LIGHT,fontFamily:“Inter,sans-serif”,display:“flex”,flexDirection:“column”}}>
<style>{CSS}</style>
<div style={{background:NAVY,padding:“18px 24px”,display:“flex”,alignItems:“center”,justifyContent:“center”}}>
<span style={{fontFamily:”‘Playfair Display’,serif”,fontSize:22,fontWeight:700,color:WHITE}}>Pro<span style={{color:GOLD}}>.G</span></span>
</div>
<div style={{flex:1,padding:“40px 20px”,maxWidth:480,width:“100%”,margin:“0 auto”}}>
<div style={{textAlign:“center”,marginBottom:36}}>
<div style={{fontSize:40,marginBottom:16}}>🌍</div>
<h2 style={{fontFamily:”‘Playfair Display’,serif”,fontSize:24,fontWeight:700,color:TEXT,marginBottom:8}}>Select your language</h2>
<p style={{color:SLATE,fontSize:13}}>Choose your preferred language to continue</p>
</div>
<div style={{display:“grid”,gridTemplateColumns:“1fr 1fr”,gap:10}}>
{LANGS.map(l=>(
<button key={l.code} onClick={()=>onSelect(l.code)} style={{border:`1.5px solid ${BORDER}`,borderRadius:14,padding:“16px 12px”,background:WHITE,cursor:“pointer”,textAlign:“center”,transition:“all .2s”,boxShadow:“0 1px 3px rgba(0,0,0,.06)”}}>
<div style={{fontSize:26,marginBottom:6}}>{l.flag}</div>
<p style={{fontWeight:600,fontSize:13,color:TEXT}}>{l.label}</p>
<p style={{fontSize:10,color:MUTED,marginTop:2}}>{l.code.toUpperCase()}</p>
</button>
))}
</div>
</div>
{/* Admin login modal */}
{showAdminLogin && (
<div className=“overlay” onClick={() => { setShowAdminLogin(false); setAdminPinInput(””); setAdminError(””); }}>
<div className=“sheet” onClick={e => e.stopPropagation()}>
<div style={{ width: 34, height: 4, background: BORDER, borderRadius: 99, margin: “0 auto 22px” }} />
<div style={{ textAlign: “center”, marginBottom: 22 }}>
<div style={{ width: 56, height: 56, borderRadius: 16, background: `${GOLD}15`, border: `1px solid ${GOLD}30`, display: “flex”, alignItems: “center”, justifyContent: “center”, fontSize: 26, margin: “0 auto 14px” }}>🛡️</div>
<h3 style={{ fontFamily: “‘Playfair Display’,serif”, fontSize: 20, fontWeight: 700, color: TEXT }}>Accès Administrateur</h3>
<p style={{ color: MUTED, fontSize: 13, marginTop: 6 }}>Entrez votre code d’accès admin</p>
</div>
<div style={{ marginBottom: 16 }}>
<input className=“inp” type=“password” placeholder=“Code administrateur” value={adminPinInput} onChange={e => setAdminPinInput(e.target.value)} onKeyDown={e => e.key === “Enter” && handleAdminLogin()} style={{ textAlign: “center”, fontSize: 18, fontWeight: 700, letterSpacing: 4 }} />
{adminError && <p style={{ color: “#DC2626”, fontSize: 12, textAlign: “center”, marginTop: 8, fontWeight: 600 }}>{adminError}</p>}
</div>
<button className=“btn-p” onClick={handleAdminLogin} style={{ width: “100%”, padding: 14, borderRadius: 12 }}>Accéder au tableau de bord</button>
<p style={{ textAlign: “center”, fontSize: 11, color: MUTED, marginTop: 10 }}>Code par défaut : <strong>PROG2025</strong> — à changer en production</p>
</div>
</div>
)}

```
  {/* Admin panel full screen */}
  {showAdmin && <AdminPanel onClose={() => setShowAdmin(false)} />}
</div>
```

);
}

// ─── AUTH ─────────────────────────────────────────────────────────
function AuthScreen({onLogin}){
const {lang,t,setLang}=useLang();
const dir=LANGS.find(l=>l.code===lang)?.dir||“ltr”;
const [screen,setScreen]=useState(“welcome”);
const [form,setForm]=useState({name:””,email:””,phone:””,password:””,confirm:””});
const [pin,setPin]=useState([””,””,””,””]);
const [confirmPin,setConfirmPin]=useState([””,””,””,””]);
const [otp,setOtp]=useState(””);
const [genOtp,setGenOtp]=useState(””);
const [loading,setLoading]=useState(false);
const [toast,setToast]=useState(null);
const [showPwd,setShowPwd]=useState(false);
const [showCfm,setShowCfm]=useState(false);
const [resetSent,setResetSent]=useState(false);
const [step,setStep]=useState(1);
const [showAdmin, setShowAdmin] = useState(false);
const [showAdminLogin, setShowAdminLogin] = useState(false);
const [adminPinInput, setAdminPinInput] = useState(””);
const [adminError, setAdminError] = useState(””);
const [showLangPicker, setShowLangPicker] = useState(false);
const pinRefs=[useRef(),useRef(),useRef(),useRef()];
const cPinRefs=[useRef(),useRef(),useRef(),useRef()];

const notify=(msg,type=“err”)=>{setToast({msg,type});setTimeout(()=>setToast(null),3200);};
const f=(k,v)=>setForm(p=>({…p,[k]:v}));
const handlePinInput=(val,idx,arr,setArr,refs)=>{if(!/^\d*$/.test(val))return;const n=[…arr];n[idx]=val.slice(-1);setArr(n);if(val&&idx<3)refs[idx+1].current?.focus();};
const handlePinKey=(e,idx,refs)=>{if(e.key===“Backspace”&&!e.target.value&&idx>0)refs[idx-1].current?.focus();};

const step1=()=>{
if(!form.name.trim())return notify(t.enterName);
if(!form.email.includes(”@”))return notify(t.invalidEmailMsg);
if(!form.phone.trim())return notify(t.enterPhone);
if(form.password.length<6)return notify(t.passwordTooShort);
if(form.password!==form.confirm)return notify(t.passwordsDontMatch);
setStep(2);
};
const step2=()=>{
if(pin.some(d=>d===””)||pin.join(””).length<4)return notify(t.pinRequired);
if(confirmPin.join(””)!==pin.join(””))return notify(t.pinsDontMatch);
const c=Math.floor(100000+Math.random()*900000).toString();
setGenOtp(c); notify(`${t.verificationCode}: ${c}`,“ok”); setStep(3);
};
const doRegister=async()=>{
if(otp!==genOtp)return notify(t.invalidCode);
setLoading(true);
try{
let ex=null;try{ex=await window.storage.get(`prog:user:${form.email.toLowerCase()}`,true);}catch(e){}
if(ex?.value){setLoading(false);return notify(t.nameTaken);}
const ph=await hashStr(form.password),pinh=await hashStr(pin.join(””));
const u={name:form.name.trim(),email:form.email.toLowerCase(),phone:form.phone.trim(),passwordHash:ph,pinHash:pinh,plan:“starter”,lang,createdAt:Date.now()};
await window.storage.set(`prog:user:${form.email.toLowerCase()}`,JSON.stringify(u),true);
await window.storage.set(“prog:session”,JSON.stringify({email:form.email.toLowerCase(),name:form.name.trim(),plan:“starter”,lang}));
notify(t.accountCreated,“ok”);
setTimeout(()=>onLogin({email:form.email.toLowerCase(),name:form.name.trim(),plan:“starter”,lang}),900);
}catch(e){notify(t.errorTryAgain);}
setLoading(false);
};
const doLogin=async()=>{
if(!form.email.includes(”@”))return notify(t.invalidEmailMsg);
if(!form.password)return notify(t.password);
setLoading(true);
try{
let res=null;try{res=await window.storage.get(`prog:user:${form.email.toLowerCase()}`,true);}catch(e){}
if(!res?.value){setLoading(false);return notify(t.accountNotFound);}
const u=JSON.parse(res.value);
const ph=await hashStr(form.password);
if(ph!==u.passwordHash){setLoading(false);return notify(t.wrongPassword);}
const sessionLang=u.lang||lang;
await window.storage.set(“prog:session”,JSON.stringify({email:u.email,name:u.name,plan:u.plan||“starter”,lang:sessionLang}));
if(sessionLang!==lang)setLang(sessionLang);
notify(`${t.goodDay.replace(",","")} ${u.name.split(" ")[0]}!`,“ok”);
setTimeout(()=>onLogin({email:u.email,name:u.name,plan:u.plan||“starter”,lang:sessionLang}),700);
}catch(e){notify(t.errorTryAgain);}
setLoading(false);
};
const doForgot=async()=>{
if(!form.email.includes(”@”))return notify(t.invalidEmailMsg);
setLoading(true);await new Promise(r=>setTimeout(r,1400));setResetSent(true);setLoading(false);
};

const inp={width:“100%”,border:`1.5px solid ${BORDER}`,borderRadius:10,padding:“13px 16px”,fontSize:14,background:WHITE,color:TEXT,outline:“none”,fontFamily:“Inter,sans-serif”,direction:dir};

if(showLangPicker)return(
<div style={{minHeight:“100vh”,background:LIGHT,fontFamily:“Inter,sans-serif”,display:“flex”,flexDirection:“column”}}>
<style>{CSS}</style>
<div style={{background:NAVY,padding:“18px 24px”,display:“flex”,alignItems:“center”,justifyContent:“space-between”}}>
<span style={{fontFamily:”‘Playfair Display’,serif”,fontSize:20,fontWeight:700,color:WHITE}}>Pro<span style={{color:GOLD}}>.G</span></span>
<button onClick={()=>setShowLangPicker(false)} style={{background:“rgba(255,255,255,.1)”,border:“none”,borderRadius:8,padding:“6px 12px”,color:WHITE,fontSize:12,fontWeight:600,cursor:“pointer”}}>✕</button>
</div>
<div style={{flex:1,padding:“32px 20px”,maxWidth:480,width:“100%”,margin:“0 auto”}}>
<h2 style={{fontFamily:”‘Playfair Display’,serif”,fontSize:22,fontWeight:700,color:TEXT,marginBottom:20,textAlign:“center”}}>{t.selectLanguage}</h2>
<div style={{display:“grid”,gridTemplateColumns:“1fr 1fr”,gap:10}}>
{LANGS.map(l=>(
<button key={l.code} onClick={()=>{setLang(l.code);setShowLangPicker(false);notify(getLang(l.code).languageChanged,“ok”);}} style={{border:`1.5px solid ${l.code===lang?NAVY:BORDER}`,borderRadius:14,padding:“14px 12px”,background:l.code===lang?`${NAVY}08`:WHITE,cursor:“pointer”,textAlign:“center”,transition:“all .2s”}}>
<div style={{fontSize:24,marginBottom:4}}>{l.flag}</div>
<p style={{fontWeight:600,fontSize:13,color:l.code===lang?NAVY:TEXT}}>{l.label}</p>
{l.code===lang&&<p style={{fontSize:9,color:NAVY,fontWeight:700,marginTop:2}}>✓ ACTIVE</p>}
</button>
))}
</div>
</div>
</div>
);

return(
<div style={{minHeight:“100vh”,background:LIGHT,fontFamily:“Inter,sans-serif”,display:“flex”,flexDirection:“column”,direction:dir}}>
<style>{CSS}</style>
<Toast toast={toast}/>
<div style={{background:NAVY,padding:“14px 20px”,display:“flex”,alignItems:“center”,justifyContent:“space-between”}}>
<span style={{fontFamily:”‘Playfair Display’,serif”,fontSize:20,fontWeight:700,color:WHITE}}>Pro<span style={{color:GOLD}}>.G</span></span>
<button onClick={()=>setShowLangPicker(true)} style={{background:“rgba(255,255,255,.1)”,border:“1px solid rgba(255,255,255,.2)”,borderRadius:8,padding:“6px 12px”,color:WHITE,fontSize:12,fontWeight:600,cursor:“pointer”,display:“flex”,alignItems:“center”,gap:6}}>
{LANGS.find(l=>l.code===lang)?.flag} {LANGS.find(l=>l.code===lang)?.label}
</button>
</div>

```
  <div style={{flex:1,display:"flex",alignItems:"center",justifyContent:"center",padding:"32px 20px"}}>
    <div style={{width:"100%",maxWidth:420,animation:"up .4s cubic-bezier(.22,1,.36,1)"}}>

      {screen==="welcome"&&(
        <div>
          <div style={{textAlign:"center",marginBottom:36}}>
            <div style={{width:68,height:68,borderRadius:20,background:NAVY,display:"flex",alignItems:"center",justifyContent:"center",margin:"0 auto 18px",boxShadow:"0 8px 32px rgba(10,22,40,.3)"}}><span style={{fontSize:28}}>🏦</span></div>
            <h1 style={{fontFamily:"'Playfair Display',serif",fontSize:26,fontWeight:700,color:TEXT,marginBottom:8}}>{t.welcomeTo} Pro<span style={{color:GOLD}}>.G</span></h1>
            <p style={{color:SLATE,fontSize:13,lineHeight:1.7,whiteSpace:"pre-line"}}>{t.appTagline}</p>
          </div>
          <div style={{display:"flex",flexDirection:"column",gap:12}}>
            <button className="btn-p" onClick={()=>{setScreen("register");setStep(1);}} style={{width:"100%",padding:16,fontSize:15,borderRadius:12}}>{t.openAccount}</button>
            <button className="btn-s" onClick={()=>setScreen("login")} style={{width:"100%",padding:16,fontSize:15,borderRadius:12}}>{t.signIn}</button>
          </div>
          <div style={{marginTop:28,padding:"16px",background:WHITE,borderRadius:14,border:`1px solid ${BORDER}`}}>
            <div style={{display:"flex",gap:12,justifyContent:"center"}}>
              {[[t.bankGrade,"🔒"],[t.aiPowered,"📈"],[t.globalCurr,"🌍"]].map(([label,icon],i)=>(
                <div key={i} style={{flex:1,textAlign:"center"}}>
                  <div style={{fontSize:20,marginBottom:4}}>{icon}</div>
                  <p style={{fontSize:10,color:SLATE,fontWeight:500,lineHeight:1.4,whiteSpace:"pre-line"}}>{label}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {screen==="register"&&(
        <div>
          <button onClick={()=>step===1?setScreen("welcome"):setStep(s=>s-1)} style={{background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:13,fontWeight:600,marginBottom:20,padding:0,display:"flex",alignItems:"center",gap:6}}>{t.back}</button>
          <div style={{display:"flex",gap:6,marginBottom:24}}>
            {[1,2,3].map(s=><div key={s} style={{flex:1}}><div style={{height:3,borderRadius:99,background:step>=s?NAVY:BORDER,transition:"background .3s"}}/><p style={{fontSize:10,color:step>=s?NAVY:MUTED,fontWeight:600,marginTop:4,textAlign:"center"}}>{t.step} {s}</p></div>)}
          </div>

          {step===1&&(<>
            <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,color:TEXT,marginBottom:4}}>{t.personalInfo}</h2>
            <p style={{color:SLATE,fontSize:13,marginBottom:22}}>{t.provideDetails}</p>
            <div style={{display:"flex",flexDirection:"column",gap:13}}>
              {[{k:"name",label:t.fullName,p:t.fullName,tp:"text"},{k:"email",label:t.emailAddress,p:t.emailAddress,tp:"email"},{k:"phone",label:t.phone,p:t.phone,tp:"tel"}].map(({k,label,p,tp})=>(
                <div key={k}><Lbl dir={dir}>{label}</Lbl><input type={tp} placeholder={p} value={form[k]} onChange={e=>f(k,e.target.value)} style={inp}/></div>
              ))}
              <div><Lbl dir={dir}>{t.password}</Lbl><div style={{position:"relative"}}><input type={showPwd?"text":"password"} placeholder={t.passwordMin} value={form.password} onChange={e=>f("password",e.target.value)} style={inp}/><button onClick={()=>setShowPwd(p=>!p)} style={{position:"absolute",right:14,top:"50%",transform:"translateY(-50%)",background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:12,fontWeight:600}}>{showPwd?t.hide:t.show}</button></div></div>
              <div><Lbl dir={dir}>{t.confirmPassword}</Lbl><div style={{position:"relative"}}><input type={showCfm?"text":"password"} placeholder={t.reEnter} value={form.confirm} onChange={e=>f("confirm",e.target.value)} style={inp}/><button onClick={()=>setShowCfm(p=>!p)} style={{position:"absolute",right:14,top:"50%",transform:"translateY(-50%)",background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:12,fontWeight:600}}>{showCfm?t.hide:t.show}</button></div></div>
              <button className="btn-p" onClick={step1} style={{width:"100%",padding:15,marginTop:4,borderRadius:12}}>{t.continue}</button>
              <p style={{textAlign:"center",fontSize:12,color:SLATE}}>{t.alreadyAccount} <span onClick={()=>setScreen("login")} style={{color:NAVY,fontWeight:600,cursor:"pointer"}}>{t.signIn}</span></p>
            </div>
          </>)}

          {step===2&&(<>
            <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,color:TEXT,marginBottom:4}}>{t.setPin}</h2>
            <p style={{color:SLATE,fontSize:13,lineHeight:1.6,marginBottom:24}}>{t.choosePIN}</p>
            <div style={{marginBottom:24}}><Lbl dir={dir}>{t.yourPin}</Lbl><div style={{display:"flex",gap:12,justifyContent:"center",marginTop:8}}>{pin.map((d,i)=><input key={i} ref={pinRefs[i]} className="pin-box" maxLength={1} value={d} onChange={e=>handlePinInput(e.target.value,i,pin,setPin,pinRefs)} onKeyDown={e=>handlePinKey(e,i,pinRefs)} type="password"/>)}</div></div>
            <div style={{marginBottom:28}}><Lbl dir={dir}>{t.confirmPin}</Lbl><div style={{display:"flex",gap:12,justifyContent:"center",marginTop:8}}>{confirmPin.map((d,i)=><input key={i} ref={cPinRefs[i]} className="pin-box" maxLength={1} value={d} onChange={e=>handlePinInput(e.target.value,i,confirmPin,setConfirmPin,cPinRefs)} onKeyDown={e=>handlePinKey(e,i,cPinRefs)} type="password"/>)}</div></div>
            <button className="btn-p" onClick={step2} style={{width:"100%",padding:15,borderRadius:12}}>{t.continue}</button>
          </>)}

          {step===3&&(<>
            <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,color:TEXT,marginBottom:4}}>{t.verifyEmail}</h2>
            <p style={{color:SLATE,fontSize:13,lineHeight:1.6,marginBottom:8}}>{t.codeSentTo} <strong>{form.email}</strong>.</p>
            <div style={{background:"#FFFBEB",border:"1px solid #FDE68A",borderRadius:10,padding:"12px 16px",marginBottom:22}}><p style={{fontSize:12,color:"#92400E",fontWeight:500}}>📧 {t.simulated}</p></div>
            <Lbl dir={dir}>{t.verificationCode}</Lbl>
            <input type="text" maxLength={6} placeholder="— — — — — —" value={otp} onChange={e=>setOtp(e.target.value.replace(/\D/g,""))} style={{...inp,fontSize:24,fontWeight:700,letterSpacing:8,textAlign:"center",marginBottom:20,marginTop:4}}/>
            <button className="btn-p" onClick={doRegister} disabled={loading} style={{width:"100%",padding:15,borderRadius:12,opacity:loading?.6:1}}>{loading?t.creating:t.createAccount}</button>
            <p style={{textAlign:"center",fontSize:12,color:SLATE,marginTop:12,cursor:"pointer"}} onClick={()=>{const c=Math.floor(100000+Math.random()*900000).toString();setGenOtp(c);notify(`${t.verificationCode}: ${c}`,"ok");}}>{t.resendCode}</p>
          </>)}
        </div>
      )}

      {screen==="login"&&(
        <div>
          <button onClick={()=>setScreen("welcome")} style={{background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:13,fontWeight:600,marginBottom:20,padding:0}}>{t.back}</button>
          <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:24,fontWeight:700,color:TEXT,marginBottom:4}}>{t.signIn}</h2>
          <p style={{color:SLATE,fontSize:13,marginBottom:24}}>{t.welcomeBack}</p>
          <div style={{display:"flex",flexDirection:"column",gap:13}}>
            <div><Lbl dir={dir}>{t.emailAddress}</Lbl><input type="email" placeholder={t.emailAddress} value={form.email} onChange={e=>f("email",e.target.value)} style={inp}/></div>
            <div><Lbl dir={dir}>{t.password}</Lbl><div style={{position:"relative"}}><input type={showPwd?"text":"password"} placeholder={t.password} value={form.password} onChange={e=>f("password",e.target.value)} onKeyDown={e=>e.key==="Enter"&&doLogin()} style={inp}/><button onClick={()=>setShowPwd(p=>!p)} style={{position:"absolute",right:14,top:"50%",transform:"translateY(-50%)",background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:12,fontWeight:600}}>{showPwd?t.hide:t.show}</button></div></div>
            <p onClick={()=>{setScreen("forgot");setResetSent(false);}} style={{textAlign:"right",fontSize:12,color:NAVY,fontWeight:600,cursor:"pointer"}}>{t.forgotPassword}</p>
            <button className="btn-p" onClick={doLogin} disabled={loading} style={{width:"100%",padding:15,borderRadius:12,opacity:loading?.6:1}}>{loading?t.signingIn:t.signIn}</button>
            <p style={{textAlign:"center",fontSize:12,color:SLATE}}>{t.noAccount} <span onClick={()=>{setScreen("register");setStep(1);}} style={{color:NAVY,fontWeight:600,cursor:"pointer"}}>{t.openAccount}</span></p>
          </div>
        </div>
      )}

      {screen==="forgot"&&(
        <div>
          <button onClick={()=>setScreen("login")} style={{background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:13,fontWeight:600,marginBottom:20,padding:0}}>{t.back}</button>
          <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:24,fontWeight:700,color:TEXT,marginBottom:4}}>{t.resetPassword}</h2>
          {!resetSent?(<>
            <p style={{color:SLATE,fontSize:13,marginBottom:22,lineHeight:1.6}}>{t.enterEmailReset}</p>
            <div style={{display:"flex",flexDirection:"column",gap:13}}>
              <div><Lbl dir={dir}>{t.emailAddress}</Lbl><input type="email" placeholder={t.emailAddress} value={form.email} onChange={e=>f("email",e.target.value)} style={inp}/></div>
              <button className="btn-p" onClick={doForgot} disabled={loading} style={{width:"100%",padding:15,borderRadius:12,opacity:loading?.6:1}}>{loading?t.sending:t.sendResetLink}</button>
            </div>
          </>):(
            <div style={{textAlign:"center",paddingTop:16}}>
              <div style={{fontSize:48,marginBottom:16}}>📬</div>
              <p style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:18,marginBottom:8}}>{t.checkInbox}</p>
              <p style={{color:SLATE,fontSize:13,lineHeight:1.6,marginBottom:24}}>{t.resetLinkSent} <strong>{form.email}</strong>.</p>
              <button className="btn-p" onClick={()=>setScreen("login")} style={{padding:"13px 28px",borderRadius:12}}>{t.backToSignIn}</button>
            </div>
          )}
        </div>
      )}
    </div>
  </div>
  <div style={{padding:"14px 24px",textAlign:"center",borderTop:`1px solid ${BORDER}`}}>
    <p style={{fontSize:11,color:MUTED}}>{t.version}</p>
  </div>
</div>
```

);
}

// ─── MAIN ─────────────────────────────────────────────────────────
export default function ProG(){
const [user,setUser]=useState(null);
const [loading,setLoading]=useState(true);
const [lang,setLangState]=useState(null); // null = not yet determined

const setLang=(code)=>{
setLangState(code);
try{window.storage.set(“prog:lang”,code);}catch(e){}
};

useEffect(()=>{
const boot = async () => {
let savedLang = null;
let sessionUser = null;

```
  try { const r = await window.storage.get("prog:lang"); if (r?.value) savedLang = r.value; } catch(e) {}
  try { const s = await window.storage.get("prog:session"); if (s?.value) { sessionUser = JSON.parse(s.value); if (!savedLang) savedLang = sessionUser.lang || null; } } catch(e) {}

  setLangState(savedLang || detectBrowserLang() || "en");
  if (sessionUser) setUser(sessionUser);
  setLoading(false);
};

// Fallback timeout — if storage hangs, unblock after 3s
const timeout = setTimeout(() => {
  setLangState(detectBrowserLang() || "en");
  setLoading(false);
}, 3000);

boot().finally(() => clearTimeout(timeout));
```

},[]);

const logout=async()=>{try{await window.storage.delete(“prog:session”);}catch(e){} setUser(null);};

const t=getLang(lang||“en”);

if(loading)return(
<div style={{minHeight:“100vh”,background:LIGHT,display:“flex”,flexDirection:“column”,fontFamily:“Inter,sans-serif”}}>
<style>{CSS}</style>
<div style={{background:NAVY,padding:“18px 24px”,textAlign:“center”}}><span style={{fontFamily:”‘Playfair Display’,serif”,fontSize:22,fontWeight:700,color:WHITE}}>Pro<span style={{color:GOLD}}>.G</span></span></div>
<div style={{flex:1,display:“flex”,alignItems:“center”,justifyContent:“center”}}><div style={{textAlign:“center”}}><div style={{fontSize:32,marginBottom:12}}>🏦</div><p style={{color:MUTED,fontSize:13}}>Loading…</p></div></div>
</div>
);

// Show language picker only on first ever launch (no saved lang, no session)
if(!lang&&!user)return <LangCtx.Provider value={{lang:“en”,t:getLang(“en”),setLang}}><LangPicker onSelect={(code)=>setLang(code)}/></LangCtx.Provider>;

const effectiveLang=lang||“en”;
const ctx={lang:effectiveLang,t:getLang(effectiveLang),setLang};

if(!user)return <LangCtx.Provider value={ctx}><AuthScreen onLogin={setUser}/></LangCtx.Provider>;
return <LangCtx.Provider value={ctx}><App user={user} onLogout={logout}/></LangCtx.Provider>;
}

// ─── ADMIN PANEL ──────────────────────────────────────────────────
const ADMIN_CODE = “PROG2025”; // Code admin par défaut — à changer dans les paramètres

function AdminPanel({ onClose }) {
const [adminTab, setAdminTab] = useState(“stats”);
const [stats, setStats] = useState({ users: 0, transactions: 0, totalDeposited: 0, projects: 0, collectives: 0 });
const [users, setUsers] = useState([]);
const [transactions, setTransactions] = useState([]);
const [payConfig, setPayConfig] = useState({ iban: “”, bic: “”, holder: “”, paypal: “”, stripe_pk: “”, cinetpay_key: “” });
const [configSaved, setConfigSaved] = useState(false);
const [loading, setLoading] = useState(true);
const [toast, setToast] = useState(null);

const notify = (msg, type = “ok”) => { setToast({ msg, type }); setTimeout(() => setToast(null), 2500); };

useEffect(() => { loadAdminData(); }, []);

const loadAdminData = async () => {
setLoading(true);
try {
// Load payment config (personal storage — only admin sees this)
const cfg = await window.storage.get(“prog:admin:payconfig”);
if (cfg?.value) setPayConfig(JSON.parse(cfg.value));

```
  // Load all users (shared storage)
  const userKeys = await window.storage.list("prog:user:", true);
  const allUsers = [];
  for (const k of (userKeys?.keys || [])) {
    try {
      const r = await window.storage.get(k, true);
      if (r?.value) {
        const u = JSON.parse(r.value);
        // Load their projects
        const pk = await window.storage.get(`prog:projects:${u.email}`);
        const projs = pk?.value ? JSON.parse(pk.value) : [];
        allUsers.push({ ...u, projectCount: projs.length, totalSaved: projs.reduce((a, p) => a + (p.saved || 0), 0) });
      }
    } catch (e) {}
  }
  setUsers(allUsers);

  // Load collectives
  const colKeys = await window.storage.list("prog:collective:", true);
  let colCount = colKeys?.keys?.length || 0;

  // Simulate transaction history (in production, fetched from payment API)
  const fakeTx = allUsers.flatMap((u, i) => Array.from({ length: Math.min(u.projectCount, 3) }, (_, j) => ({
    id: `TX-${Date.now() - i * 86400000 - j * 3600000}`,
    user: u.name, email: u.email,
    amount: (Math.random() * 500 + 10).toFixed(2),
    currency: ["EUR", "USD", "XOF"][j % 3],
    method: ["Carte", "Mobile Money", "IBAN", "Crypto"][j % 4],
    status: ["Complété", "En cours", "Complété"][j % 3],
    date: new Date(Date.now() - i * 86400000 - j * 3600000).toLocaleDateString("fr-FR"),
  })));
  setTransactions(fakeTx);

  const totalDep = allUsers.reduce((a, u) => a + u.totalSaved, 0);
  setStats({ users: allUsers.length, transactions: fakeTx.length, totalDeposited: totalDep, projects: allUsers.reduce((a, u) => a + u.projectCount, 0), collectives: colCount });
} catch (e) { console.error(e); }
setLoading(false);
```

};

const savePayConfig = async () => {
try {
await window.storage.set(“prog:admin:payconfig”, JSON.stringify(payConfig));
setConfigSaved(true); notify(“Configuration sauvegardée 🔒”);
setTimeout(() => setConfigSaved(false), 3000);
} catch (e) { notify(“Erreur de sauvegarde”, “err”); }
};

const ADMIN_TABS = [
{ id: “stats”, label: “Stats”, icon: “📊” },
{ id: “users”, label: “Utilisateurs”, icon: “👥” },
{ id: “transactions”, label: “Transactions”, icon: “📄” },
{ id: “payments”, label: “Paiements”, icon: “💰” },
];

return (
<div style={{ position: “fixed”, inset: 0, background: “#080F1A”, zIndex: 500, fontFamily: “Inter,sans-serif”, display: “flex”, flexDirection: “column”, overflowY: “auto” }}>
<style>{`@keyframes up2{from{opacity:0;transform:translateY(12px)}to{opacity:1;transform:translateY(0)}} @keyframes toast2{0%{opacity:0}10%,85%{opacity:1}100%{opacity:0}} .afade{animation:up2 .35s cubic-bezier(.22,1,.36,1) both;} .acard{background:rgba(255,255,255,.05);border:1px solid rgba(255,255,255,.08);border-radius:14px;padding:18px;} .ainp{width:100%;border:1px solid rgba(255,255,255,.12);border-radius:9px;padding:11px 14px;font-size:13px;background:rgba(255,255,255,.06);color:#F0F0FF;outline:none;font-family:inherit;} .ainp:focus{border-color:rgba(201,168,76,.5);} .ainp::placeholder{color:rgba(255,255,255,.2);} ::-webkit-scrollbar{width:0;}`}</style>

```
  {toast && <div style={{ position: "fixed", top: 16, left: "50%", transform: "translateX(-50%)", background: toast.type === "err" ? "#DC2626" : "#0F766E", color: "#fff", padding: "10px 20px", borderRadius: 10, fontWeight: 600, fontSize: 13, zIndex: 999, animation: "toast2 2.5s ease forwards", whiteSpace: "nowrap" }}>{toast.msg}</div>}

  {/* Header */}
  <div style={{ background: "rgba(255,255,255,.04)", borderBottom: "1px solid rgba(255,255,255,.08)", padding: "16px 20px", display: "flex", alignItems: "center", justifyContent: "space-between", flexShrink: 0 }}>
    <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
      <div style={{ width: 36, height: 36, borderRadius: 10, background: `${GOLD}20`, border: `1px solid ${GOLD}40`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 16 }}>🛡️</div>
      <div>
        <p style={{ fontFamily: "'Playfair Display',serif", fontSize: 16, fontWeight: 700, color: "#F0F0FF" }}>Pro<span style={{ color: GOLD }}>.G</span> Admin</p>
        <p style={{ fontSize: 10, color: "rgba(255,255,255,.3)", marginTop: 1 }}>Tableau de bord administrateur</p>
      </div>
    </div>
    <button onClick={onClose} style={{ background: "rgba(255,255,255,.08)", border: "1px solid rgba(255,255,255,.12)", borderRadius: 8, padding: "7px 14px", color: "rgba(255,255,255,.6)", fontSize: 12, fontWeight: 600, cursor: "pointer" }}>✕ Fermer</button>
  </div>

  {/* Sub nav */}
  <div style={{ display: "flex", gap: 6, padding: "12px 20px", borderBottom: "1px solid rgba(255,255,255,.06)", flexShrink: 0, overflowX: "auto" }}>
    {ADMIN_TABS.map(t => (
      <button key={t.id} onClick={() => setAdminTab(t.id)} style={{ flexShrink: 0, padding: "8px 14px", borderRadius: 8, border: `1px solid ${adminTab === t.id ? GOLD + "50" : "rgba(255,255,255,.1)"}`, background: adminTab === t.id ? `${GOLD}15` : "transparent", color: adminTab === t.id ? GOLD2 : "rgba(255,255,255,.4)", fontSize: 12, fontWeight: 600, cursor: "pointer", display: "flex", alignItems: "center", gap: 6 }}>
        {t.icon} {t.label}
      </button>
    ))}
  </div>

  <div style={{ flex: 1, padding: "20px", maxWidth: 600, width: "100%", margin: "0 auto" }}>
    {loading ? (
      <div style={{ textAlign: "center", padding: 60 }}><p style={{ color: "rgba(255,255,255,.3)", fontSize: 13 }}>Chargement des données…</p></div>
    ) : (
      <>
        {/* ── STATS ── */}
        {adminTab === "stats" && (
          <div className="afade">
            <p style={{ fontSize: 10, color: "rgba(255,255,255,.3)", fontWeight: 600, letterSpacing: 1.2, textTransform: "uppercase", marginBottom: 16 }}>Vue d'ensemble</p>
            <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 10, marginBottom: 16 }}>
              {[
                { label: "Utilisateurs", value: stats.users, icon: "👥", color: "#3B82F6" },
                { label: "Projets actifs", value: stats.projects, icon: "◆", color: "#0F766E" },
                { label: "Transactions", value: stats.transactions, icon: "📄", color: GOLD },
                { label: "Collectifs", value: stats.collectives, icon: "◈", color: "#8B5CF6" },
              ].map((s, i) => (
                <div key={i} className="acard" style={{ animationDelay: `${i * .07}s` }}>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 10 }}>
                    <span style={{ fontSize: 20 }}>{s.icon}</span>
                    <span style={{ fontSize: 10, fontWeight: 700, padding: "2px 7px", borderRadius: 99, background: `${s.color}20`, color: s.color }}>LIVE</span>
                  </div>
                  <p style={{ fontFamily: "'Playfair Display',serif", fontSize: 28, fontWeight: 700, color: "#F0F0FF" }}>{s.value}</p>
                  <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", marginTop: 3 }}>{s.label}</p>
                </div>
              ))}
            </div>

            {/* Total épargne */}
            <div className="acard" style={{ marginBottom: 16, background: `linear-gradient(135deg,${NAVY},${NAVY2})`, border: `1px solid ${GOLD}25` }}>
              <p style={{ color: "rgba(255,255,255,.4)", fontSize: 10, fontWeight: 700, letterSpacing: 1.5, textTransform: "uppercase", marginBottom: 8 }}>Total épargne plateforme</p>
              <p style={{ fontFamily: "'Playfair Display',serif", fontSize: 34, fontWeight: 700, color: "#fff" }}>{stats.totalDeposited.toLocaleString("fr-FR", { minimumFractionDigits: 2 })} <span style={{ fontSize: 18, color: "rgba(255,255,255,.4)", fontWeight: 400 }}>EUR</span></p>
              <p style={{ color: "rgba(255,255,255,.3)", fontSize: 12, marginTop: 6 }}>Réparti sur {stats.users} utilisateurs · {stats.projects} projets</p>
            </div>

            {/* Plan distribution */}
            <div className="acard">
              <p style={{ fontSize: 11, fontWeight: 700, color: "rgba(255,255,255,.4)", letterSpacing: .8, textTransform: "uppercase", marginBottom: 14 }}>Répartition par plan</p>
              {PLANS.map((p, i) => {
                const count = users.filter(u => (u.plan || "starter") === p.id).length;
                const pct = stats.users > 0 ? Math.round((count / stats.users) * 100) : 0;
                return (
                  <div key={i} style={{ marginBottom: i < PLANS.length - 1 ? 12 : 0 }}>
                    <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 5 }}>
                      <span style={{ fontSize: 12, fontWeight: 600, color: "#F0F0FF" }}>{p.name}</span>
                      <span style={{ fontSize: 12, color: "rgba(255,255,255,.4)" }}>{count} users ({pct}%)</span>
                    </div>
                    <div style={{ height: 4, background: "rgba(255,255,255,.08)", borderRadius: 99, overflow: "hidden" }}>
                      <div style={{ height: "100%", width: `${pct}%`, background: p.color, borderRadius: 99, transition: "width .8s" }} />
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {/* ── USERS ── */}
        {adminTab === "users" && (
          <div className="afade">
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 16 }}>
              <p style={{ fontSize: 10, color: "rgba(255,255,255,.3)", fontWeight: 600, letterSpacing: 1.2, textTransform: "uppercase" }}>Utilisateurs inscrits</p>
              <span style={{ fontSize: 11, fontWeight: 700, padding: "3px 10px", borderRadius: 99, background: "rgba(59,130,246,.2)", color: "#93C5FD" }}>{users.length} total</span>
            </div>
            {users.length === 0 ? (
              <div style={{ textAlign: "center", padding: 50 }}>
                <p style={{ color: "rgba(255,255,255,.3)", fontSize: 13 }}>Aucun utilisateur inscrit</p>
              </div>
            ) : (
              <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
                {users.map((u, i) => {
                  const p = getPlan(u.plan || "starter");
                  return (
                    <div key={i} className="acard" style={{ animationDelay: `${i * .05}s` }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
                        <div style={{ width: 40, height: 40, borderRadius: 11, background: `${GOLD}20`, border: `1px solid ${GOLD}30`, display: "flex", alignItems: "center", justifyContent: "center", color: GOLD, fontWeight: 700, fontSize: 16, flexShrink: 0 }}>{u.name?.charAt(0).toUpperCase()}</div>
                        <div style={{ flex: 1 }}>
                          <div style={{ display: "flex", alignItems: "center", gap: 7, marginBottom: 2 }}>
                            <p style={{ fontWeight: 600, fontSize: 14, color: "#F0F0FF" }}>{u.name}</p>
                            <span style={{ fontSize: 9, fontWeight: 700, padding: "1px 6px", borderRadius: 4, background: `${p.color}25`, color: p.color }}>{p.name}</span>
                          </div>
                          <p style={{ color: "rgba(255,255,255,.3)", fontSize: 11 }}>{u.email}</p>
                          {u.phone && <p style={{ color: "rgba(255,255,255,.2)", fontSize: 10, marginTop: 1 }}>{u.phone}</p>}
                        </div>
                        <div style={{ textAlign: "right", flexShrink: 0 }}>
                          <p style={{ fontFamily: "'Playfair Display',serif", fontWeight: 700, fontSize: 14, color: "#F0F0FF" }}>{u.totalSaved.toLocaleString("fr-FR")}</p>
                          <p style={{ fontSize: 10, color: "rgba(255,255,255,.3)", marginTop: 1 }}>{u.projectCount} projet{u.projectCount !== 1 ? "s" : ""}</p>
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}

        {/* ── TRANSACTIONS ── */}
        {adminTab === "transactions" && (
          <div className="afade">
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 16 }}>
              <p style={{ fontSize: 10, color: "rgba(255,255,255,.3)", fontWeight: 600, letterSpacing: 1.2, textTransform: "uppercase" }}>Historique des transactions</p>
              <span style={{ fontSize: 11, fontWeight: 700, padding: "3px 10px", borderRadius: 99, background: `${GOLD}20`, color: GOLD2 }}>{transactions.length} total</span>
            </div>
            {transactions.length === 0 ? (
              <div style={{ textAlign: "center", padding: 50 }}><p style={{ color: "rgba(255,255,255,.3)", fontSize: 13 }}>Aucune transaction</p></div>
            ) : (
              <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
                {transactions.map((tx, i) => (
                  <div key={i} className="acard" style={{ animationDelay: `${i * .04}s`, padding: "14px 16px" }}>
                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 8 }}>
                      <div>
                        <p style={{ fontWeight: 600, fontSize: 13, color: "#F0F0FF", marginBottom: 2 }}>{tx.user}</p>
                        <p style={{ fontSize: 10, color: "rgba(255,255,255,.25)" }}>{tx.id} · {tx.date}</p>
                      </div>
                      <div style={{ textAlign: "right" }}>
                        <p style={{ fontFamily: "'Playfair Display',serif", fontWeight: 700, fontSize: 15, color: "#F0F0FF" }}>{tx.amount} {tx.currency}</p>
                        <span style={{ fontSize: 10, fontWeight: 700, padding: "2px 7px", borderRadius: 4, background: tx.status === "Complété" ? "rgba(15,118,110,.3)" : "rgba(217,119,6,.3)", color: tx.status === "Complété" ? "#34D399" : GOLD2 }}>{tx.status}</span>
                      </div>
                    </div>
                    <div style={{ display: "flex", gap: 6 }}>
                      <span style={{ fontSize: 10, padding: "2px 8px", borderRadius: 4, background: "rgba(255,255,255,.06)", color: "rgba(255,255,255,.4)" }}>{tx.method}</span>
                      <span style={{ fontSize: 10, padding: "2px 8px", borderRadius: 4, background: "rgba(255,255,255,.06)", color: "rgba(255,255,255,.4)" }}>{tx.email}</span>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}

        {/* ── PAYMENT CONFIG ── */}
        {adminTab === "payments" && (
          <div className="afade">
            <p style={{ fontSize: 10, color: "rgba(255,255,255,.3)", fontWeight: 600, letterSpacing: 1.2, textTransform: "uppercase", marginBottom: 6 }}>Configuration des paiements</p>
            <p style={{ fontSize: 12, color: "rgba(255,255,255,.3)", lineHeight: 1.6, marginBottom: 20 }}>Ces informations sont stockées dans votre espace personnel privé et utilisées pour recevoir les paiements des utilisateurs.</p>

            {/* IBAN section */}
            <div className="acard" style={{ marginBottom: 14 }}>
              <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 16 }}>
                <span style={{ fontSize: 20 }}>🏦</span>
                <p style={{ fontWeight: 700, fontSize: 14, color: "#F0F0FF" }}>Coordonnées bancaires (IBAN)</p>
              </div>
              <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
                <div>
                  <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", fontWeight: 600, letterSpacing: .8, textTransform: "uppercase", marginBottom: 6 }}>Titulaire</p>
                  <input className="ainp" placeholder="Nom du titulaire" value={payConfig.holder} onChange={e => setPayConfig(p => ({ ...p, holder: e.target.value }))} />
                </div>
                <div>
                  <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", fontWeight: 600, letterSpacing: .8, textTransform: "uppercase", marginBottom: 6 }}>IBAN</p>
                  <input className="ainp" placeholder="FR76 XXXX XXXX XXXX XXXX XXXX XXX" value={payConfig.iban} onChange={e => setPayConfig(p => ({ ...p, iban: e.target.value.toUpperCase() }))} style={{ fontFamily: "monospace", letterSpacing: 1 }} />
                </div>
                <div>
                  <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", fontWeight: 600, letterSpacing: .8, textTransform: "uppercase", marginBottom: 6 }}>BIC / SWIFT</p>
                  <input className="ainp" placeholder="CEPAFRPPXXX" value={payConfig.bic} onChange={e => setPayConfig(p => ({ ...p, bic: e.target.value.toUpperCase() }))} style={{ fontFamily: "monospace", letterSpacing: 1 }} />
                </div>
              </div>
            </div>

            {/* PayPal section */}
            <div className="acard" style={{ marginBottom: 14 }}>
              <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 16 }}>
                <span style={{ fontSize: 20 }}>🅿️</span>
                <p style={{ fontWeight: 700, fontSize: 14, color: "#F0F0FF" }}>PayPal</p>
              </div>
              <div>
                <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", fontWeight: 600, letterSpacing: .8, textTransform: "uppercase", marginBottom: 6 }}>Email PayPal</p>
                <input className="ainp" placeholder="votre@paypal.com" type="email" value={payConfig.paypal} onChange={e => setPayConfig(p => ({ ...p, paypal: e.target.value }))} />
              </div>
            </div>

            {/* API Keys section */}
            <div className="acard" style={{ marginBottom: 20 }}>
              <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 16 }}>
                <span style={{ fontSize: 20 }}>⚙️</span>
                <p style={{ fontWeight: 700, fontSize: 14, color: "#F0F0FF" }}>Clés API partenaires</p>
              </div>
              <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
                <div>
                  <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", fontWeight: 600, letterSpacing: .8, textTransform: "uppercase", marginBottom: 6 }}>Stripe Public Key</p>
                  <input className="ainp" placeholder="pk_live_XXXXXXXXXXXX" value={payConfig.stripe_pk} onChange={e => setPayConfig(p => ({ ...p, stripe_pk: e.target.value }))} style={{ fontFamily: "monospace", fontSize: 12 }} />
                </div>
                <div>
                  <p style={{ fontSize: 11, color: "rgba(255,255,255,.35)", fontWeight: 600, letterSpacing: .8, textTransform: "uppercase", marginBottom: 6 }}>CinetPay API Key</p>
                  <input className="ainp" placeholder="Clé API CinetPay" value={payConfig.cinetpay_key} onChange={e => setPayConfig(p => ({ ...p, cinetpay_key: e.target.value }))} style={{ fontFamily: "monospace", fontSize: 12 }} />
                </div>
              </div>
              <div style={{ marginTop: 12, padding: "10px 12px", background: "rgba(217,119,6,.1)", borderRadius: 8, border: "1px solid rgba(217,119,6,.25)" }}>
                <p style={{ fontSize: 11, color: GOLD2, lineHeight: 1.5 }}>🔒 Les clés secrètes (Secret Key) ne doivent jamais être stockées côté client. Elles s'intègrent uniquement sur votre backend sécurisé.</p>
              </div>
            </div>

            <button onClick={savePayConfig} style={{ width: "100%", background: configSaved ? "#0F766E" : `linear-gradient(135deg,${NAVY},${NAVY2})`, color: "#fff", border: `1px solid ${configSaved ? "#34D399" : GOLD + "30"}`, borderRadius: 12, padding: 15, fontSize: 14, fontWeight: 700, cursor: "pointer", fontFamily: "Inter,sans-serif", transition: "all .3s" }}>
              {configSaved ? "✓ Configuration sauvegardée" : "🔒 Sauvegarder la configuration"}
            </button>
            <p style={{ textAlign: "center", fontSize: 11, color: "rgba(255,255,255,.2)", marginTop: 10 }}>Stockage chiffré dans votre espace personnel · Invisible des utilisateurs</p>
          </div>
        )}
      </>
    )}
  </div>
</div>
```

);
}

const PAYMENT_METHODS = [
{id:“card”,    icon:“💳”, label:“Carte bancaire”,   sublabel:“Visa, Mastercard, CB”,        color:”#1E3A5F”},
{id:“mobile”,  icon:“📱”, label:“Mobile Money”,     sublabel:“Orange, MTN, Wave, Moov”,     color:”#0F766E”},
{id:“iban”,    icon:“🏦”, label:“Virement bancaire”, sublabel:“IBAN / SWIFT international”, color:”#7C3AED”},
{id:“crypto”,  icon:“₿”,  label:“Crypto”,           sublabel:“USDT, BTC, ETH, USDC”,       color:”#D97706”},
];
const MOBILE_OPS = [
{id:“orange”,label:“Orange Money”,flag:“🟠”,countries:“SN, CI, ML, CM, GN…”},
{id:“mtn”,   label:“MTN MoMo”,    flag:“🟡”,countries:“GH, NG, CI, CM, RW…”},
{id:“wave”,  label:“Wave”,        flag:“🔵”,countries:“SN, CI, ML, GN”},
{id:“moov”,  label:“Moov Money”,  flag:“🟢”,countries:“CI, BJ, TG, BF…”},
{id:“airtel”,label:“Airtel Money”,flag:“🔴”,countries:“KE, TZ, UG, RW…”},
];
const CRYPTOS = [
{id:“usdt”,symbol:“USDT”,name:“Tether”,network:“TRC-20 / ERC-20”,icon:“💵”},
{id:“btc”, symbol:“BTC”, name:“Bitcoin”,network:“Bitcoin Network”,  icon:“₿”},
{id:“eth”, symbol:“ETH”, name:“Ethereum”,network:“ERC-20”,          icon:“⟠”},
{id:“usdc”,symbol:“USDC”,name:“USD Coin”,network:“ERC-20 / Polygon”,icon:“🔵”},
];

function DepositTab({user, projects, collectives, currentPlan, notify}){
const [method, setMethod]   = useState(null);   // card | mobile | iban | crypto
const [step,   setStep]     = useState(1);       // 1=method 2=details 3=confirm 4=done
const [target, setTarget]   = useState(“personal”); // personal | collective id
const [amount, setAmount]   = useState(””);
const [currency, setCurrency] = useState(“EUR”);
// Card
const [cardNum,  setCardNum]  = useState(””);
const [cardExp,  setCardExp]  = useState(””);
const [cardCvv,  setCardCvv]  = useState(””);
const [cardName, setCardName] = useState(””);
// Mobile
const [mobileOp,  setMobileOp]  = useState(“orange”);
const [mobileNum, setMobileNum] = useState(””);
// IBAN
const [iban,   setIban]   = useState(””);
const [bic,    setBic]    = useState(””);
const [holder, setHolder] = useState(””);
// Crypto
const [cryptoAsset,  setCryptoAsset]  = useState(“usdt”);
const [cryptoWallet, setCryptoWallet] = useState(””);
// Processing
const [loading,  setLoading]  = useState(false);
const [txRef,    setTxRef]    = useState(””);
const [txDate,   setTxDate]   = useState(””);

const reset=()=>{setMethod(null);setStep(1);setAmount(””);setCardNum(””);setCardExp(””);setCardCvv(””);setCardName(””);setMobileNum(””);setIban(””);setBic(””);setHolder(””);setCryptoWallet(””);};

const formatCard = v => v.replace(/\D/g,””).slice(0,16).replace(/(.{4})/g,”$1 “).trim();
const formatExp  = v => { const d=v.replace(/\D/g,””).slice(0,4); return d.length>2?d.slice(0,2)+”/”+d.slice(2):d; };

const feeRate = parseFloat(currentPlan.fee)/100;
const fee     = amount ? (parseFloat(amount)*feeRate).toFixed(2) : “0.00”;
const total   = amount ? (parseFloat(amount)+parseFloat(fee)).toFixed(2) : “0.00”;

const simulatePayment = async () => {
setLoading(true);
await new Promise(r=>setTimeout(r, 2200));
const ref = “PRG-”+Date.now().toString(36).toUpperCase();
const now  = new Date().toLocaleString(“fr-FR”);
setTxRef(ref); setTxDate(now);
setStep(4); setLoading(false);
};

const canProceed = () => {
if(!amount||parseFloat(amount)<=0) return false;
if(method===“card”) return cardNum.replace(/\s/g,””).length===16&&cardExp.length===5&&cardCvv.length>=3&&cardName.trim();
if(method===“mobile”) return mobileNum.trim().length>=8;
if(method===“iban”) return iban.replace(/\s/g,””).length>=15&&holder.trim();
if(method===“crypto”) return cryptoWallet.trim().length>=10;
return false;
};

const inpS={width:“100%”,border:`1.5px solid ${BORDER}`,borderRadius:10,padding:“12px 15px”,fontSize:14,background:WHITE,color:TEXT,outline:“none”,fontFamily:“Inter,sans-serif”};
const curM = PAYMENT_METHODS.find(m=>m.id===method)||PAYMENT_METHODS[0];
const curCrypto = CRYPTOS.find(c=>c.id===cryptoAsset)||CRYPTOS[0];
const curOp = MOBILE_OPS.find(o=>o.id===mobileOp)||MOBILE_OPS[0];
const allTargets = [
{id:“personal”,label:“💼 Mon épargne personnelle”},
…collectives.map(c=>({id:c.code, label:`👥 ${c.name}`})),
];

return (
<div className=“fade” style={{padding:“24px 20px 0”}}>

```
  {/* STEP 4 — SUCCESS */}
  {step===4&&(
    <div style={{textAlign:"center",paddingTop:20}}>
      <div style={{width:80,height:80,borderRadius:99,background:"#F0FDF4",border:"2px solid #86EFAC",display:"flex",alignItems:"center",justifyContent:"center",fontSize:36,margin:"0 auto 20px",animation:"pop .4s cubic-bezier(.22,1,.36,1)"}}>✓</div>
      <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,color:TEXT,marginBottom:6}}>Virement initié</h2>
      <p style={{color:SLATE,fontSize:13,marginBottom:24,lineHeight:1.6}}>Votre transaction a été soumise avec succès. Les fonds seront crédités après confirmation.</p>
      <div style={{background:LIGHT,borderRadius:16,padding:"20px",marginBottom:24,border:`1px solid ${BORDER}`,textAlign:"left"}}>
        <p style={{fontSize:10,fontWeight:700,color:MUTED,letterSpacing:1,textTransform:"uppercase",marginBottom:14}}>Récapitulatif</p>
        {[
          ["Référence",txRef],
          ["Date",txDate],
          ["Méthode",curM.icon+" "+curM.label],
          ["Montant",`${amount} ${currency}`],
          ["Frais (${currentPlan.name})",`${fee} ${currency}`],
          ["Total débité",`${total} ${currency}`],
          ["Destination", allTargets.find(t=>t.id===target)?.label||"—"],
          ["Statut","⏳ En cours de traitement"],
        ].map(([k,v],i)=>(
          <div key={i} style={{display:"flex",justifyContent:"space-between",alignItems:"center",padding:"8px 0",borderBottom:i<7?`1px solid ${BORDER}`:"none"}}>
            <span style={{fontSize:12,color:MUTED,fontWeight:500}}>{k}</span>
            <span style={{fontSize:12,color:TEXT,fontWeight:600,maxWidth:"60%",textAlign:"right"}}>{v}</span>
          </div>
        ))}
      </div>
      <div style={{background:"#FFFBEB",borderRadius:12,padding:"12px 16px",marginBottom:24,border:"1px solid #FDE68A"}}>
        <p style={{fontSize:12,color:"#92400E",lineHeight:1.5}}>⚠️ <strong>Mode simulation.</strong> Aucun argent réel n'a été débité. En production, cette transaction serait traitée via {method==="card"?"Stripe":method==="mobile"?"CinetPay":method==="iban"?"SWIFT/SEPA":"un partenaire crypto"}.</p>
      </div>
      <button onClick={reset} style={{width:"100%",background:NAVY,color:WHITE,border:"none",borderRadius:12,padding:15,fontSize:14,fontWeight:600,cursor:"pointer",fontFamily:"Inter,sans-serif"}}>Nouveau virement</button>
    </div>
  )}

  {/* STEP 1 — CHOOSE METHOD */}
  {step===1&&(
    <>
      <p style={{fontSize:10,color:SLATE,fontWeight:600,letterSpacing:1.2,textTransform:"uppercase",marginBottom:4}}>Alimenter mon compte</p>
      <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,color:TEXT,marginBottom:20}}>Déposer des fonds</h2>

      {/* Destination */}
      <div style={{marginBottom:20}}>
        <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:8}}>Destination</p>
        <select value={target} onChange={e=>setTarget(e.target.value)} style={{...inpS,fontWeight:600}}>
          {allTargets.map(t=><option key={t.id} value={t.id}>{t.label}</option>)}
        </select>
      </div>

      {/* Amount */}
      <div style={{marginBottom:20}}>
        <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:8}}>Montant</p>
        <div style={{display:"flex",gap:8}}>
          <input type="number" placeholder="0.00" value={amount} onChange={e=>setAmount(e.target.value)} style={{...inpS,flex:1,fontSize:20,fontWeight:700}}/>
          <select value={currency} onChange={e=>setCurrency(e.target.value)} style={{...inpS,width:90,fontWeight:700}}>
            {["EUR","USD","GBP","XOF","MAD","NGN","GHS"].map(c=><option key={c}>{c}</option>)}
          </select>
        </div>
        <div style={{display:"flex",gap:7,marginTop:8}}>
          {[10,25,50,100,500].map(a=>(
            <button key={a} onClick={()=>setAmount(String(a))} style={{flex:1,border:`1.5px solid ${amount===String(a)?NAVY:BORDER}`,borderRadius:8,background:amount===String(a)?NAVY:WHITE,color:amount===String(a)?WHITE:SLATE,padding:"7px 0",fontSize:11,fontWeight:600,cursor:"pointer",fontFamily:"Inter,sans-serif"}}>{a}</button>
          ))}
        </div>
      </div>

      {/* Method selection */}
      <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:10}}>Mode de paiement</p>
      <div style={{display:"flex",flexDirection:"column",gap:10,marginBottom:24}}>
        {PAYMENT_METHODS.map(m=>(
          <button key={m.id} onClick={()=>{setMethod(m.id);setStep(2);}} disabled={!amount||parseFloat(amount)<=0} style={{display:"flex",alignItems:"center",gap:14,padding:"16px 18px",background:WHITE,border:`1.5px solid ${BORDER}`,borderRadius:14,cursor:"pointer",textAlign:"left",opacity:!amount||parseFloat(amount)<=0?.4:1,transition:"all .15s",fontFamily:"Inter,sans-serif"}}>
            <div style={{width:46,height:46,borderRadius:12,background:`${m.color}12`,border:`1px solid ${m.color}25`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:22,flexShrink:0}}>{m.icon}</div>
            <div style={{flex:1}}>
              <p style={{fontWeight:700,fontSize:14,color:TEXT,marginBottom:2}}>{m.label}</p>
              <p style={{fontSize:11,color:MUTED}}>{m.sublabel}</p>
            </div>
            <span style={{color:MUTED,fontSize:18}}>›</span>
          </button>
        ))}
      </div>

      {/* Architecture info */}
      <div style={{background:LIGHT,borderRadius:14,padding:"16px 18px",border:`1px solid ${BORDER}`}}>
        <p style={{fontSize:11,fontWeight:700,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:12}}>🏗️ Architecture technique</p>
        <div style={{display:"flex",flexDirection:"column",gap:8}}>
          {[
            ["💳","Carte","Stripe API + 3DS2","stripe.com/docs"],
            ["📱","Mobile Money","CinetPay API v2","cinetpay.com/api"],
            ["🏦","IBAN/SWIFT","Lemonway ou Treezor","lemonway.com"],
            ["₿","Crypto","CoinGate ou BitPay","coingate.com"],
          ].map(([icon,label,tech,url],i)=>(
            <div key={i} style={{display:"flex",alignItems:"center",gap:10,padding:"8px 0",borderBottom:i<3?`1px solid ${BORDER}`:"none"}}>
              <span style={{fontSize:16,width:24,textAlign:"center"}}>{icon}</span>
              <div style={{flex:1}}>
                <p style={{fontSize:12,fontWeight:600,color:TEXT}}>{label} <span style={{color:MUTED,fontWeight:400}}>— {tech}</span></p>
              </div>
              <span style={{fontSize:10,color:"#3B82F6",fontWeight:600}}>{url}</span>
            </div>
          ))}
        </div>
        <div style={{marginTop:12,background:"#EFF6FF",borderRadius:10,padding:"10px 12px",border:"1px solid #BFDBFE"}}>
          <p style={{fontSize:11,color:"#1D4ED8",lineHeight:1.5}}>⚙️ En production, chaque paiement déclenche un webhook sécurisé vers votre backend qui crédite le solde utilisateur après confirmation.</p>
        </div>
      </div>
    </>
  )}

  {/* STEP 2 — PAYMENT DETAILS */}
  {step===2&&(
    <>
      <button onClick={()=>setStep(1)} style={{background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:13,fontWeight:600,marginBottom:20,padding:0,display:"flex",alignItems:"center",gap:6,fontFamily:"Inter,sans-serif"}}>← Retour</button>

      <div style={{display:"flex",alignItems:"center",gap:12,marginBottom:22}}>
        <div style={{width:46,height:46,borderRadius:12,background:`${curM.color}12`,border:`1px solid ${curM.color}25`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:22}}>{curM.icon}</div>
        <div>
          <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:20,fontWeight:700}}>{curM.label}</h2>
          <p style={{color:MUTED,fontSize:12}}>{amount} {currency} → {allTargets.find(t2=>t2.id===target)?.label}</p>
        </div>
      </div>

      {/* CARD FORM */}
      {method==="card"&&(
        <div style={{display:"flex",flexDirection:"column",gap:14}}>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>Numéro de carte</p>
            <input placeholder="1234 5678 9012 3456" value={cardNum} onChange={e=>setCardNum(formatCard(e.target.value))} style={{...inpS,fontSize:18,fontWeight:700,letterSpacing:2}}/>
          </div>
          <div style={{display:"grid",gridTemplateColumns:"1fr 1fr",gap:10}}>
            <div>
              <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>Expiration</p>
              <input placeholder="MM/AA" value={cardExp} onChange={e=>setCardExp(formatExp(e.target.value))} style={{...inpS,fontSize:16,fontWeight:700,letterSpacing:2}}/>
            </div>
            <div>
              <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>CVV</p>
              <input placeholder="•••" maxLength={4} value={cardCvv} onChange={e=>setCardCvv(e.target.value.replace(/\D/g,""))} type="password" style={{...inpS,fontSize:16,fontWeight:700,letterSpacing:4}}/>
            </div>
          </div>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>Titulaire</p>
            <input placeholder="NOM PRÉNOM" value={cardName} onChange={e=>setCardName(e.target.value.toUpperCase())} style={{...inpS,fontWeight:600,letterSpacing:1}}/>
          </div>
          <div style={{background:"#F0FDF4",borderRadius:10,padding:"10px 13px",border:"1px solid #BBF7D0",display:"flex",gap:8,alignItems:"center"}}>
            <span style={{fontSize:16}}>🔒</span>
            <p style={{fontSize:11,color:"#15803D"}}>Paiement 3D Secure — Chiffrement SSL 256-bit via <strong>Stripe</strong></p>
          </div>
        </div>
      )}

      {/* MOBILE MONEY FORM */}
      {method==="mobile"&&(
        <div style={{display:"flex",flexDirection:"column",gap:14}}>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:8}}>Opérateur</p>
            <div style={{display:"flex",flexDirection:"column",gap:8}}>
              {MOBILE_OPS.map(op=>(
                <button key={op.id} onClick={()=>setMobileOp(op.id)} style={{display:"flex",alignItems:"center",gap:12,padding:"12px 14px",border:`1.5px solid ${mobileOp===op.id?NAVY:BORDER}`,borderRadius:12,background:mobileOp===op.id?`${NAVY}06`:WHITE,cursor:"pointer",textAlign:"left",fontFamily:"Inter,sans-serif"}}>
                  <span style={{fontSize:22}}>{op.flag}</span>
                  <div style={{flex:1}}>
                    <p style={{fontWeight:600,fontSize:13,color:TEXT}}>{op.label}</p>
                    <p style={{fontSize:11,color:MUTED}}>{op.countries}</p>
                  </div>
                  {mobileOp===op.id&&<span style={{color:NAVY,fontWeight:700,fontSize:16}}>✓</span>}
                </button>
              ))}
            </div>
          </div>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>Numéro {curOp.label}</p>
            <input placeholder="+221 XX XXX XX XX" value={mobileNum} onChange={e=>setMobileNum(e.target.value)} style={{...inpS,fontSize:16,fontWeight:600}} type="tel"/>
          </div>
          <div style={{background:"#F0FDF4",borderRadius:10,padding:"10px 13px",border:"1px solid #BBF7D0",display:"flex",gap:8}}>
            <span>📲</span>
            <p style={{fontSize:11,color:"#15803D",lineHeight:1.5}}>Un code OTP sera envoyé sur votre numéro pour confirmer la transaction via <strong>CinetPay</strong>.</p>
          </div>
        </div>
      )}

      {/* IBAN FORM */}
      {method==="iban"&&(
        <div style={{display:"flex",flexDirection:"column",gap:14}}>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>Titulaire du compte</p>
            <input placeholder="Nom du titulaire" value={holder} onChange={e=>setHolder(e.target.value)} style={{...inpS,fontWeight:600}}/>
          </div>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>IBAN</p>
            <input placeholder="FR76 1234 5678 9012 3456 7890 123" value={iban} onChange={e=>setIban(e.target.value.toUpperCase())} style={{...inpS,fontWeight:600,letterSpacing:1,fontSize:13}}/>
          </div>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>BIC / SWIFT (optionnel)</p>
            <input placeholder="BNPAFRPPXXX" value={bic} onChange={e=>setBic(e.target.value.toUpperCase())} style={{...inpS,fontWeight:600,letterSpacing:1}}/>
          </div>
          <div style={{background:LIGHT,borderRadius:10,padding:"12px 13px",border:`1px solid ${BORDER}`}}>
            <p style={{fontSize:11,color:MUTED,lineHeight:1.6}}>⏱ Délai : <strong>1–3 jours ouvrés</strong> (SEPA) · <strong>3–5 jours</strong> (SWIFT international)<br/>Traitement via <strong>Lemonway</strong> ou <strong>Treezor</strong></p>
          </div>
        </div>
      )}

      {/* CRYPTO FORM */}
      {method==="crypto"&&(
        <div style={{display:"flex",flexDirection:"column",gap:14}}>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:8}}>Actif</p>
            <div style={{display:"grid",gridTemplateColumns:"1fr 1fr",gap:8}}>
              {CRYPTOS.map(c=>(
                <button key={c.id} onClick={()=>setCryptoAsset(c.id)} style={{display:"flex",alignItems:"center",gap:10,padding:"12px 13px",border:`1.5px solid ${cryptoAsset===c.id?NAVY:BORDER}`,borderRadius:12,background:cryptoAsset===c.id?`${NAVY}06`:WHITE,cursor:"pointer",fontFamily:"Inter,sans-serif"}}>
                  <span style={{fontSize:20}}>{c.icon}</span>
                  <div style={{textAlign:"left"}}>
                    <p style={{fontWeight:700,fontSize:13,color:TEXT}}>{c.symbol}</p>
                    <p style={{fontSize:10,color:MUTED}}>{c.name}</p>
                  </div>
                </button>
              ))}
            </div>
          </div>
          <div style={{background:`${NAVY}06`,borderRadius:12,padding:"14px 16px",border:`1px solid ${NAVY}15`}}>
            <p style={{fontSize:11,fontWeight:700,color:NAVY,marginBottom:4}}>Réseau : {curCrypto.network}</p>
            <p style={{fontSize:11,color:MUTED,lineHeight:1.5}}>Adresse de dépôt Pro.G :</p>
            <div style={{display:"flex",alignItems:"center",gap:8,marginTop:6}}>
              <code style={{fontSize:11,color:TEXT,fontWeight:600,wordBreak:"break-all",flex:1,background:LIGHT,padding:"8px 10px",borderRadius:8,border:`1px solid ${BORDER}`}}>
                {cryptoAsset==="btc"?"1A2b3C4d5E6f7G8h9I0jKlMnOpQrStUvWx":"0x7B3aF4D9c0E2f1A8b5C6d7E9F0a1B2C3D4E5"}
              </code>
              <button onClick={()=>notify("Adresse copiée !")} style={{background:NAVY,color:WHITE,border:"none",borderRadius:8,padding:"8px 10px",fontSize:11,fontWeight:600,cursor:"pointer",fontFamily:"Inter,sans-serif",whiteSpace:"nowrap"}}>Copier</button>
            </div>
          </div>
          <div>
            <p style={{fontSize:11,fontWeight:600,color:SLATE,letterSpacing:.8,textTransform:"uppercase",marginBottom:7}}>Hash de transaction (optionnel)</p>
            <input placeholder="0x..." value={cryptoWallet} onChange={e=>setCryptoWallet(e.target.value)} style={{...inpS,fontSize:12,fontFamily:"monospace"}}/>
          </div>
          <div style={{background:"#FFFBEB",borderRadius:10,padding:"10px 13px",border:"1px solid #FDE68A"}}>
            <p style={{fontSize:11,color:"#92400E",lineHeight:1.5}}>⚡ Confirmation : <strong>1–3 blocs</strong> · Traitement via <strong>CoinGate</strong> ou <strong>BitPay</strong></p>
          </div>
        </div>
      )}

      <button onClick={()=>setStep(3)} disabled={!canProceed()} style={{width:"100%",background:canProceed()?NAVY:"#CBD5E1",color:WHITE,border:"none",borderRadius:12,padding:15,fontSize:14,fontWeight:600,cursor:canProceed()?"pointer":"not-allowed",marginTop:20,fontFamily:"Inter,sans-serif"}}>
        Vérifier et confirmer →
      </button>
    </>
  )}

  {/* STEP 3 — CONFIRM */}
  {step===3&&(
    <>
      <button onClick={()=>setStep(2)} style={{background:"none",border:"none",cursor:"pointer",color:SLATE,fontSize:13,fontWeight:600,marginBottom:20,padding:0,display:"flex",alignItems:"center",gap:6,fontFamily:"Inter,sans-serif"}}>← Modifier</button>
      <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:20,fontWeight:700,marginBottom:20}}>Confirmer le virement</h2>

      <div style={{background:LIGHT,borderRadius:16,padding:"20px",marginBottom:20,border:`1px solid ${BORDER}`}}>
        <p style={{fontSize:10,fontWeight:700,color:MUTED,letterSpacing:1,textTransform:"uppercase",marginBottom:14}}>Récapitulatif de la transaction</p>
        {[
          ["Méthode", curM.icon+" "+curM.label],
          ["Montant", `${amount} ${currency}`],
          [`Frais (${currentPlan.name} — ${currentPlan.fee})`, `${fee} ${currency}`],
          ["Total débité", `${total} ${currency}`],
          ["Destination", allTargets.find(t2=>t2.id===target)?.label||"—"],
          ...(method==="card"?[["Carte","•••• •••• •••• "+cardNum.replace(/\s/g,"").slice(-4)],["Titulaire",cardName]]:
              method==="mobile"?[["Opérateur",curOp.label],["Numéro",mobileNum]]:
              method==="iban"?[["IBAN","••••"+iban.slice(-6)],["Titulaire",holder]]:
              [["Actif",curCrypto.symbol+" ("+curCrypto.network+")"]]),
        ].map(([k,v],i,arr)=>(
          <div key={i} style={{display:"flex",justifyContent:"space-between",alignItems:"center",padding:"9px 0",borderBottom:i<arr.length-1?`1px solid ${BORDER}`:"none"}}>
            <span style={{fontSize:12,color:MUTED,fontWeight:500}}>{k}</span>
            <span style={{fontSize:12,color:i===3?NAVY:TEXT,fontWeight:i===3?800:600}}>{v}</span>
          </div>
        ))}
      </div>

      <div style={{background:"#FFFBEB",borderRadius:12,padding:"12px 14px",marginBottom:20,border:"1px solid #FDE68A"}}>
        <p style={{fontSize:12,color:"#92400E",lineHeight:1.5}}>⚠️ <strong>Simulation uniquement.</strong> En production, ce bouton déclencherait une requête sécurisée vers l'API {method==="card"?"Stripe":method==="mobile"?"CinetPay":method==="iban"?"Lemonway":"CoinGate"} avec authentification JWT.</p>
      </div>

      <button onClick={simulatePayment} disabled={loading} style={{width:"100%",background:loading?"#94A3B8":NAVY,color:WHITE,border:"none",borderRadius:12,padding:15,fontSize:15,fontWeight:700,cursor:loading?"not-allowed":"pointer",fontFamily:"Inter,sans-serif",display:"flex",alignItems:"center",justifyContent:"center",gap:8}}>
        {loading?(<><div style={{width:18,height:18,border:"2px solid rgba(255,255,255,.3)",borderTopColor:WHITE,borderRadius:99,animation:"spin 1s linear infinite"}}/> Traitement en cours…</>):"🔒 Confirmer le virement"}
      </button>
      <style>{`@keyframes spin{to{transform:rotate(360deg)}} @keyframes pop{0%{transform:scale(.7)}70%{transform:scale(1.1)}100%{transform:scale(1)}}`}</style>
    </>
  )}
</div>
```

);
}

// ─── APP ──────────────────────────────────────────────────────────
function App({user,onLogout}){
const {lang,t,setLang}=useLang();
const dir=LANGS.find(l=>l.code===lang)?.dir||“ltr”;
const [tab,setTab]=useState(“dashboard”);
const [currency,setCurrency]=useState(CURRENCIES[0]);
const [projects,setProjects]=useState([]);
const [ready,setReady]=useState(false);
const [showNew,setShowNew]=useState(false);
const [activeProject,setActiveProject]=useState(null);
const [deposit,setDeposit]=useState(””);
const [form,setForm]=useState({name:””,category:“home”,goal:””,currency:“USD”,deadline:””});
const [toast,setToast]=useState(null);
const [plan,setPlan]=useState(user.plan||“starter”);
const [showPlanDetail,setShowPlanDetail]=useState(null);
const [showLangPicker,setShowLangPicker]=useState(false);

const handleAdminLogin = () => {
if (adminPinInput === ADMIN_CODE) {
setShowAdmin(true); setShowAdminLogin(false); setAdminPinInput(””); setAdminError(””);
} else {
setAdminError(“Code incorrect”); setTimeout(() => setAdminError(””), 2000);
}
};
const [msgs,setMsgs]=useState([]);
const [cLoading,setCLoading]=useState(false);
const [analyzed,setAnalyzed]=useState(false);
const [cInput,setCInput]=useState(””);
const [ariaLang,setAriaLang]=useState(lang);
const endRef=useRef(null);
const [collectives,setCollectives]=useState([]);
const [colReady,setColReady]=useState(false);
const [showNewCol,setShowNewCol]=useState(false);
const [showJoin,setShowJoin]=useState(false);
const [activeCol,setActiveCol]=useState(null);
const [colDeposit,setColDeposit]=useState(””);
const [joinCode,setJoinCode]=useState(””);
const [inviteEmail,setInviteEmail]=useState(””);
const [colForm,setColForm]=useState({name:””,category:“home”,goal:””,currency:“USD”,deadline:””});

const key=`prog:projects:${user.email}`;
const notify=(msg,type=“ok”)=>{setToast({msg,type});setTimeout(()=>setToast(null),2800);};

useEffect(()=>{(async()=>{try{const r=await window.storage.get(key);if(r?.value)setProjects(JSON.parse(r.value));}catch(e){} setReady(true);})();},[]);
useEffect(()=>{if(!ready)return;(async()=>{try{await window.storage.set(key,JSON.stringify(projects));}catch(e){}})();},[projects,ready]);
const loadCol=async()=>{try{const keys=await window.storage.list(“prog:collective:”,true);const all=[];for(const k of(keys?.keys||[])){try{const r=await window.storage.get(k,true);if(r?.value)all.push(JSON.parse(r.value));}catch(e){}}setCollectives(all.filter(p=>p.members?.some(m=>m.email===user.email)));}catch(e){}setColReady(true);};
useEffect(()=>{loadCol();},[]);
useEffect(()=>{endRef.current?.scrollIntoView({behavior:“smooth”});},[msgs,cLoading]);

const totalSaved=projects.reduce((a,p)=>a+p.saved,0);
const totalGoal=projects.reduce((a,p)=>a+p.goal,0);
const globalPct=totalGoal>0?Math.round((totalSaved/totalGoal)*100):0;

const handleDeposit=()=>{const amt=parseFloat(deposit);if(!amt||amt<=0)return notify(t.invalidAmount,“err”);setProjects(prev=>prev.map(p=>p.id===activeProject.id?{…p,saved:Math.min(p.saved+amt,p.goal)}:p));setActiveProject(prev=>({…prev,saved:Math.min(prev.saved+amt,prev.goal)}));setDeposit(””);notify(`+${amt} ${activeProject.currency} ${t.deposited}`);};
const handleCreate=()=>{if(!form.name||!form.goal||!form.deadline)return notify(t.fillAllFields,“err”);setProjects(prev=>[…prev,{id:Date.now(),…form,goal:parseFloat(form.goal),saved:0}]);setShowNew(false);setForm({name:””,category:“home”,goal:””,currency:“USD”,deadline:””});notify(t.goalCreated);setAnalyzed(false);};
const getColSaved=p=>(p.deposits||[]).reduce((a,d)=>a+d.amount,0);
const getMyTotal=(p,email)=>(p.deposits||[]).filter(d=>d.email===email).reduce((a,d)=>a+d.amount,0);
const handleCreateCol=async()=>{if(!colForm.name||!colForm.goal||!colForm.deadline)return notify(t.fillAllFields,“err”);const code=genCode();const proj={id:`prog:collective:${code}`,code,name:colForm.name,category:colForm.category,goal:parseFloat(colForm.goal),currency:colForm.currency,deadline:colForm.deadline,creator:user.email,members:[{email:user.email,name:user.name,joined:Date.now()}],deposits:[],createdAt:Date.now()};try{await window.storage.set(`prog:collective:${code}`,JSON.stringify(proj),true);setCollectives(prev=>[…prev,proj]);setShowNewCol(false);setColForm({name:””,category:“home”,goal:””,currency:“USD”,deadline:””});notify(`${t.groupCreated} ${code}`);}catch(e){notify(“Error”,“err”);}};
const handleJoinCol=async()=>{const code=joinCode.trim().toUpperCase();if(!code)return notify(t.enterCodeMsg,“err”);try{let res=null;try{res=await window.storage.get(`prog:collective:${code}`,true);}catch(e){}if(!res?.value)return notify(t.codeNotFound,“err”);const proj=JSON.parse(res.value);if(proj.members.some(m=>m.email===user.email))return notify(t.alreadyMember,“err”);proj.members.push({email:user.email,name:user.name,joined:Date.now()});await window.storage.set(`prog:collective:${code}`,JSON.stringify(proj),true);setCollectives(prev=>[…prev,proj]);setShowJoin(false);setJoinCode(””);notify(t.joinedGroup);}catch(e){notify(“Error”,“err”);}};
const handleColDeposit=async()=>{const amt=parseFloat(colDeposit);if(!amt||amt<=0)return notify(t.invalidAmount,“err”);try{let res=null;try{res=await window.storage.get(`prog:collective:${activeCol.code}`,true);}catch(e){}if(!res?.value)return notify(“Error”,“err”);const proj=JSON.parse(res.value);proj.deposits.push({email:user.email,name:user.name,amount:amt,date:Date.now()});await window.storage.set(`prog:collective:${activeCol.code}`,JSON.stringify(proj),true);setActiveCol(proj);setCollectives(prev=>prev.map(p=>p.code===proj.code?proj:p));setColDeposit(””);notify(`+${amt} ${proj.currency} ${t.deposited}`);}catch(e){notify(“Error”,“err”);}};

const ariaT=getLang(ariaLang);
const buildCtx=()=>{if(!projects.length)return”No savings goals yet.”;return projects.map(p=>{const pct=Math.round((p.saved/p.goal)*100);const days=Math.max(0,Math.ceil((new Date(p.deadline)-new Date())/86400000));const m=days>0?((p.goal-p.saved)/(days/30)).toFixed(0):“N/A”;return`• ${p.name}: saved ${p.saved}/${p.goal} ${p.currency} (${pct}%) — ${days} days — monthly effort: ${m} ${p.currency}`;}).join(”\n”);};
const callCoach=async(userMsg)=>{const ariaLangName=LANGS.find(l=>l.code===ariaLang)?.label||“English”;const system=`You are ARIA, an AI financial advisor for Pro.G. Address ${user.name} (${plan} plan). Be professional, empathetic, analytical. ALWAYS respond in ${ariaLangName} regardless of the input language. Include specific actionable recommendations with numbers.\nGoals:\n${buildCtx()}`;const history=msgs.filter(m=>!m.hidden).map(m=>({role:m.role,content:m.content}));const res=await fetch(“https://api.anthropic.com/v1/messages”,{method:“POST”,headers:{“Content-Type”:“application/json”},body:JSON.stringify({model:“claude-sonnet-4-20250514”,max_tokens:1000,system,messages:[…history,{role:“user”,content:userMsg}]})});const data=await res.json();return data.content?.[0]?.text||“Unable to generate response.”;};
const analyze=async()=>{if(cLoading)return;setCLoading(true);setMsgs([]);try{const prompt=!projects.length?“No goals yet. Greet the user and explain what you can do.”:“Analyze all savings goals. Provide executive summary, highest-risk goal, healthiest goal, and 2 priority actions with numbers.”;const reply=await callCoach(prompt);setMsgs([{role:“user”,content:prompt,hidden:true},{role:“assistant”,content:reply}]);setAnalyzed(true);}catch(e){setMsgs([{role:“assistant”,content:“Connection error. Please try again.”}]);}setCLoading(false);};
const send=async()=>{const msg=cInput.trim();if(!msg||cLoading)return;setCInput(””);const updated=[…msgs,{role:“user”,content:msg}];setMsgs(updated);setCLoading(true);try{const reply=await callCoach(msg);setMsgs([…updated,{role:“assistant”,content:reply}]);}catch(e){setMsgs([…updated,{role:“assistant”,content:“Error.”}]);}setCLoading(false);};

const currentPlan=getPlan(plan);
const firstName=user.name.split(” “)[0];
const inpStyle={width:“100%”,border:`1.5px solid ${BORDER}`,borderRadius:10,padding:“13px 16px”,fontSize:14,background:WHITE,color:TEXT,outline:“none”,fontFamily:“Inter,sans-serif”,direction:dir};

const TABS_TRANSLATED=[
{id:“dashboard”,label:“Accueil”,icon:“▪”},
{id:“projects”,label:t.goals.charAt(0).toUpperCase()+t.goals.slice(1),icon:“◆”},
{id:“collective”,label:“Collectif”,icon:“◈”},
{id:“deposit”,label:“Dépôt”,icon:“💸”},
{id:“coach”,label:“ARIA”,icon:“✦”},
{id:“more”,label:t.account,icon:“○”},
];

// Lang picker overlay
if(showLangPicker)return(
<div style={{minHeight:“100vh”,background:LIGHT,fontFamily:“Inter,sans-serif”,display:“flex”,flexDirection:“column”}}>
<style>{CSS}</style>
<div style={{background:NAVY,padding:“14px 20px”,display:“flex”,alignItems:“center”,justifyContent:“space-between”}}>
<span style={{fontFamily:”‘Playfair Display’,serif”,fontSize:20,fontWeight:700,color:WHITE}}>Pro<span style={{color:GOLD}}>.G</span></span>
<button onClick={()=>setShowLangPicker(false)} style={{background:“rgba(255,255,255,.1)”,border:“none”,borderRadius:8,padding:“6px 12px”,color:WHITE,fontSize:12,fontWeight:600,cursor:“pointer”}}>✕</button>
</div>
<div style={{flex:1,padding:“32px 20px”,maxWidth:480,width:“100%”,margin:“0 auto”}}>
<h2 style={{fontFamily:”‘Playfair Display’,serif”,fontSize:22,fontWeight:700,color:TEXT,marginBottom:20,textAlign:“center”}}>{t.selectLanguage}</h2>
<div style={{display:“grid”,gridTemplateColumns:“1fr 1fr”,gap:10}}>
{LANGS.map(l=>(
<button key={l.code} onClick={()=>{setLang(l.code);setShowLangPicker(false);notify(getLang(l.code).languageChanged,“ok”);}} style={{border:`1.5px solid ${l.code===lang?NAVY:BORDER}`,borderRadius:14,padding:“14px 12px”,background:l.code===lang?`${NAVY}08`:WHITE,cursor:“pointer”,textAlign:“center”,transition:“all .2s”}}>
<div style={{fontSize:24,marginBottom:4}}>{l.flag}</div>
<p style={{fontWeight:600,fontSize:13,color:l.code===lang?NAVY:TEXT}}>{l.label}</p>
{l.code===lang&&<p style={{fontSize:9,color:NAVY,fontWeight:700,marginTop:2}}>✓</p>}
</button>
))}
</div>
</div>
</div>
);

return(
<div style={{minHeight:“100vh”,background:LIGHT,fontFamily:“Inter,sans-serif”,color:TEXT,display:“flex”,flexDirection:“column”,direction:dir}}>
<style>{CSS}</style>
<Toast toast={toast}/>
<div style={{background:NAVY,padding:“13px 18px”,display:“flex”,alignItems:“center”,justifyContent:“space-between”,position:“sticky”,top:0,zIndex:50}}>
<span style={{fontFamily:”‘Playfair Display’,serif”,fontSize:19,fontWeight:700,color:WHITE}}>Pro<span style={{color:GOLD}}>.G</span></span>
<div style={{display:“flex”,gap:8,alignItems:“center”}}>
<button onClick={()=>setShowLangPicker(true)} style={{background:“rgba(255,255,255,.1)”,border:“1px solid rgba(255,255,255,.2)”,borderRadius:8,padding:“5px 10px”,color:WHITE,fontSize:11,fontWeight:600,cursor:“pointer”}}>
{LANGS.find(l=>l.code===lang)?.flag} {LANGS.find(l=>l.code===lang)?.label}
</button>
<span style={{fontSize:10,fontWeight:600,padding:“3px 9px”,borderRadius:99,background:`${currentPlan.color}30`,color:GOLD2,border:`1px solid ${GOLD}30`}}>{currentPlan.name}</span>
<div style={{width:32,height:32,borderRadius:9,background:`${GOLD}20`,border:`1px solid ${GOLD}40`,display:“flex”,alignItems:“center”,justifyContent:“center”,color:GOLD,fontWeight:700,fontSize:14}}>{user.name.charAt(0).toUpperCase()}</div>
</div>
</div>

```
  <div style={{flex:1,maxWidth:480,width:"100%",margin:"0 auto",padding:"0 0 100px"}}>

    {/* DASHBOARD */}
    {tab==="dashboard"&&(
      <div className="fade" style={{padding:"24px 20px 0"}}>
        <div style={{marginBottom:22}}><p style={{fontSize:13,color:SLATE,marginBottom:2}}>{t.goodDay}</p><h1 style={{fontFamily:"'Playfair Display',serif",fontSize:24,fontWeight:700,letterSpacing:"-.3px"}}>{firstName}</h1></div>
        <div style={{background:`linear-gradient(135deg,${NAVY},${NAVY2})`,borderRadius:20,padding:"26px 22px",marginBottom:14,position:"relative",overflow:"hidden",boxShadow:`0 12px 40px rgba(10,22,40,.22)`}}>
          <div style={{position:"absolute",top:-50,right:-50,width:180,height:180,borderRadius:"50%",background:"rgba(201,168,76,.06)"}}/>
          <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:18}}>
            <div>
              <p style={{color:"rgba(255,255,255,.4)",fontSize:10,fontWeight:600,letterSpacing:1.5,textTransform:"uppercase",marginBottom:8}}>{t.totalSavings}</p>
              <p style={{color:WHITE,fontSize:34,fontWeight:700,fontFamily:"'Playfair Display',serif",letterSpacing:"-1px"}}>{totalSaved.toLocaleString()} <span style={{fontSize:17,fontWeight:400,color:"rgba(255,255,255,.4)"}}>{currency.symbol}</span></p>
            </div>
            <div style={{background:"rgba(201,168,76,.15)",border:"1px solid rgba(201,168,76,.3)",borderRadius:10,padding:"7px 11px",textAlign:"center"}}>
              <p style={{color:GOLD2,fontSize:17,fontWeight:700}}>{globalPct}%</p>
              <p style={{color:"rgba(255,255,255,.4)",fontSize:9,fontWeight:600,letterSpacing:.5}}>{t.funded}</p>
            </div>
          </div>
          <p style={{color:"rgba(255,255,255,.3)",fontSize:11,marginBottom:14}}>{projects.length} {projects.length===1?t.goal:t.goals} · {t.target} {totalGoal.toLocaleString()} {currency.symbol}</p>
          <div style={{height:4,background:"rgba(255,255,255,.1)",borderRadius:99,overflow:"hidden"}}><div style={{height:"100%",width:`${globalPct}%`,background:`linear-gradient(90deg,${GOLD},${GOLD2})`,borderRadius:99,transition:"width .9s"}}/></div>
        </div>
        {collectives.length>0&&(
          <div className="card" style={{marginBottom:14,padding:18}}>
            <p style={{fontSize:10,fontWeight:600,color:SLATE,letterSpacing:1.2,textTransform:"uppercase",marginBottom:12}}>{t.groupProjects}</p>
            {collectives.map(p=>{const saved=getColSaved(p),pct=Math.min(100,Math.round((saved/p.goal)*100));return(<div key={p.code} style={{marginBottom:10}}><div style={{display:"flex",justifyContent:"space-between",marginBottom:4}}><span style={{fontWeight:600,fontSize:12}}>{p.name}</span><span style={{fontSize:11,color:MUTED}}>{saved.toLocaleString()} / {p.goal.toLocaleString()} {getCur(p.currency).symbol}</span></div><div className="prog-track"><div className={`prog-fill ${pct>=100?"done":""}`} style={{width:`${pct}%`}}/></div></div>);})}
          </div>
        )}
        <div onClick={()=>setTab("coach")} style={{cursor:"pointer",borderRadius:14,padding:"15px 18px",marginBottom:14,background:WHITE,border:`1px solid ${BORDER}`,display:"flex",alignItems:"center",gap:13}}>
          <div style={{width:44,height:44,borderRadius:12,background:`linear-gradient(135deg,${NAVY},${NAVY2})`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:19,flexShrink:0}}>✦</div>
          <div style={{flex:1}}><p style={{fontWeight:600,fontSize:14,color:TEXT,marginBottom:2}}>{t.ariaAdvisor}</p><p style={{fontSize:12,color:SLATE}}>{t.personalizedAnalysis}</p></div>
          <span style={{color:MUTED,fontSize:18}}>›</span>
        </div>
        <div className="card" style={{padding:16}}>
          <p style={{fontSize:10,fontWeight:600,color:SLATE,letterSpacing:1.2,textTransform:"uppercase",marginBottom:10}}>{t.displayCurrency}</p>
          <div style={{display:"flex",gap:7,overflowX:"auto",paddingBottom:2}}>
            {CURRENCIES.map(c=><button key={c.code} onClick={()=>setCurrency(c)} style={{flexShrink:0,padding:"7px 11px",borderRadius:8,border:`1.5px solid ${currency.code===c.code?NAVY:BORDER}`,background:currency.code===c.code?NAVY:WHITE,color:currency.code===c.code?WHITE:SLATE,cursor:"pointer",fontSize:11,fontWeight:600,transition:"all .15s"}}>{c.flag} {c.code}</button>)}
          </div>
        </div>
      </div>
    )}

    {/* GOALS */}
    {tab==="projects"&&(
      <div className="fade" style={{padding:"24px 20px 0"}}>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:22}}>
          <div><p style={{fontSize:10,color:SLATE,fontWeight:600,letterSpacing:1.2,textTransform:"uppercase",marginBottom:4}}>{t.savingsGoals}</p><h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700}}>{projects.length===0?t.noGoalsYet:`${projects.length} ${projects.length===1?t.activeGoal:t.activeGoals2}`}</h2></div>
          <button className="btn-p" onClick={()=>setShowNew(true)} style={{padding:"9px 15px",fontSize:12,borderRadius:9}}>{t.newGoal}</button>
        </div>
        {projects.length===0?(
          <div style={{textAlign:"center",padding:"60px 20px"}}>
            <div style={{fontSize:50,marginBottom:14}}>📋</div>
            <p style={{fontFamily:"'Playfair Display',serif",fontSize:18,fontWeight:700,marginBottom:8}}>{t.noGoalsYet}</p>
            <p style={{color:SLATE,fontSize:13,lineHeight:1.7,marginBottom:22}}>{t.defineGoal}</p>
            <button className="btn-p" onClick={()=>setShowNew(true)} style={{padding:"12px 22px",borderRadius:10}}>{t.createFirstGoal}</button>
          </div>
        ):(
          <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {projects.map((p,i)=>{
              const cur=getCur(p.currency),cat=getCat(p.category,lang);
              const pct=Math.min(100,Math.round((p.saved/p.goal)*100));
              const days=Math.max(0,Math.ceil((new Date(p.deadline)-new Date())/86400000));
              const isLate=days<30&&pct<50;
              return(
                <div key={p.id} className="card" style={{animationDelay:`${i*.07}s`,cursor:"pointer",padding:18}} onClick={()=>setActiveProject(p)}>
                  <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:14}}>
                    <div style={{display:"flex",gap:11,alignItems:"center"}}>
                      <div style={{width:42,height:42,borderRadius:11,background:`${NAVY}08`,border:`1px solid ${NAVY}12`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:19}}>{cat.icon}</div>
                      <div><p style={{fontWeight:600,fontSize:14,marginBottom:3,color:TEXT}}>{p.name}</p><p style={{color:MUTED,fontSize:11}}>{cur.flag} {p.currency} · {days} {t.daysRemaining}</p></div>
                    </div>
                    <span style={{fontSize:10,fontWeight:600,padding:"3px 9px",borderRadius:6,background:isLate?"#FEF2F2":"#F0FDF4",color:isLate?"#DC2626":"#16A34A",border:`1px solid ${isLate?"#FECACA":"#BBF7D0"}`}}>{isLate?t.atRisk:t.onTrack}</span>
                  </div>
                  <div style={{display:"flex",justifyContent:"space-between",alignItems:"baseline",marginBottom:9}}>
                    <span style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:19,color:TEXT}}>{p.saved.toLocaleString()} <span style={{color:MUTED,fontWeight:400,fontSize:12}}>{cur.symbol}</span></span>
                    <span style={{color:MUTED,fontSize:11}}>{t.of} {p.goal.toLocaleString()} {cur.symbol}</span>
                  </div>
                  <div className="prog-track" style={{marginBottom:7}}><div className={`prog-fill ${pct>=100?"done":""}`} style={{width:`${pct}%`}}/></div>
                  <div style={{display:"flex",justifyContent:"space-between"}}>
                    <p style={{fontSize:11,color:pct>=100?"#0F766E":SLATE,fontWeight:600}}>{pct>=100?t.goalAchieved:`${pct}${t.funded2}`}</p>
                    <p style={{fontSize:11,color:MUTED}}>{(p.goal-p.saved).toLocaleString()} {cur.symbol} {t.remaining}</p>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    )}

    {/* COLLECTIVE */}
    {tab==="collective"&&(
      <div className="fade" style={{padding:"24px 20px 0"}}>
        <p style={{fontSize:10,color:SLATE,fontWeight:600,letterSpacing:1.2,textTransform:"uppercase",marginBottom:4}}>{t.groupSavings}</p>
        <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,marginBottom:6}}>{t.collaborativeGoals}</h2>
        <p style={{color:SLATE,fontSize:13,marginBottom:22,lineHeight:1.5}}>{t.saveTogether}</p>

        {/* Tontine banner */}
        <div style={{background:`linear-gradient(135deg,${NAVY},${NAVY2})`,borderRadius:16,padding:"18px 20px",marginBottom:22,position:"relative",overflow:"hidden"}}>
          <div style={{position:"absolute",top:-30,right:-30,width:100,height:100,borderRadius:"50%",background:"rgba(201,168,76,.08)"}}/>
          <div style={{display:"flex",alignItems:"center",gap:12,marginBottom:8}}>
            <span style={{fontSize:22}}>🔁</span>
            <div>
              <p style={{color:WHITE,fontWeight:700,fontSize:14}}>Tontine numérique</p>
              <p style={{color:"rgba(255,255,255,.45)",fontSize:11}}>Épargne rotative entre proches</p>
            </div>
            <span style={{marginLeft:"auto",fontSize:10,fontWeight:700,padding:"3px 9px",borderRadius:99,background:"rgba(255,255,255,.12)",color:GOLD2,border:`1px solid ${GOLD}30`}}>BIENTÔT</span>
          </div>
          <p style={{color:"rgba(255,255,255,.45)",fontSize:12,lineHeight:1.5}}>Cotisez ensemble chaque mois et recevez la cagnotte à tour de rôle — automatique, transparent, sécurisé.</p>
        </div>
        <div style={{display:"flex",gap:10,marginBottom:22}}>
          <button className="btn-p" onClick={()=>setShowNewCol(true)} style={{flex:1,padding:12,fontSize:12,borderRadius:10}}>{t.createGroup}</button>
          <button className="btn-s" onClick={()=>setShowJoin(true)} style={{flex:1,padding:12,fontSize:12,borderRadius:10}}>{t.joinGroup}</button>
        </div>
        {!colReady?<div style={{textAlign:"center",padding:40}}><p style={{color:MUTED}}>…</p></div>
        :collectives.length===0?(
          <div style={{textAlign:"center",padding:"48px 20px"}}>
            <div style={{fontSize:50,marginBottom:14}}>👥</div>
            <p style={{fontFamily:"'Playfair Display',serif",fontSize:18,fontWeight:700,marginBottom:8}}>{t.noGroupProjects}</p>
            <p style={{color:SLATE,fontSize:13,lineHeight:1.6}}>{t.createOrJoin}</p>
          </div>
        ):(
          <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {collectives.map((p,i)=>{
              const saved=getColSaved(p),pct=Math.min(100,Math.round((saved/p.goal)*100));
              const days=Math.max(0,Math.ceil((new Date(p.deadline)-new Date())/86400000));
              const myT=getMyTotal(p,user.email),cat=getCat(p.category,lang),cur=getCur(p.currency);
              return(
                <div key={p.code} className="card" style={{animationDelay:`${i*.07}s`,cursor:"pointer",padding:18}} onClick={()=>{setActiveCol(p);loadCol();}}>
                  <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:13}}>
                    <div style={{display:"flex",gap:11,alignItems:"center"}}>
                      <div style={{width:42,height:42,borderRadius:11,background:`${NAVY}08`,border:`1px solid ${NAVY}12`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:19}}>{cat.icon}</div>
                      <div><p style={{fontWeight:600,fontSize:14,marginBottom:3}}>{p.name}</p><p style={{color:MUTED,fontSize:11}}>{p.members.length} members · {days} {t.daysRemaining}</p></div>
                    </div>
                    <span style={{fontSize:10,fontWeight:600,padding:"3px 9px",borderRadius:6,background:"#EFF6FF",color:"#1D4ED8",border:"1px solid #BFDBFE"}}>{t.group}</span>
                  </div>
                  <div style={{display:"flex",justifyContent:"space-between",alignItems:"baseline",marginBottom:9}}>
                    <span style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:19}}>{saved.toLocaleString()} <span style={{color:MUTED,fontWeight:400,fontSize:12}}>{cur.symbol}</span></span>
                    <span style={{color:MUTED,fontSize:11}}>{t.of} {p.goal.toLocaleString()} {cur.symbol}</span>
                  </div>
                  <div className="prog-track" style={{marginBottom:7}}><div className={`prog-fill ${pct>=100?"done":""}`} style={{width:`${pct}%`}}/></div>
                  <div style={{display:"flex",justifyContent:"space-between"}}>
                    <p style={{fontSize:11,color:pct>=100?"#0F766E":SLATE,fontWeight:600}}>{pct>=100?t.goalAchieved:`${pct}${t.funded2}`}</p>
                    <p style={{fontSize:11,color:MUTED}}>{t.myShare} {myT.toLocaleString()} {cur.symbol}</p>
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>
    )}

    {/* ═══ DÉPÔT & VIREMENT ═══ */}
    {tab==="deposit"&&<DepositTab user={user} projects={projects} collectives={collectives} currentPlan={currentPlan} notify={notify}/>}

    {/* COACH */}
    {tab==="coach"&&(
      <div className="fade" style={{padding:"24px 20px 0",display:"flex",flexDirection:"column",minHeight:"calc(100vh - 100px)"}}>
        <div style={{paddingBottom:18,borderBottom:`1px solid ${BORDER}`,marginBottom:18}}>
          <div style={{display:"flex",alignItems:"center",gap:13,marginBottom:14}}>
            <div style={{width:48,height:48,borderRadius:13,background:`linear-gradient(135deg,${NAVY},${NAVY2})`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:21,flexShrink:0}}>✦</div>
            <div><h2 style={{fontFamily:"'Playfair Display',serif",fontSize:19,fontWeight:700}}>ARIA <span style={{color:MUTED,fontSize:12,fontWeight:400,fontFamily:"Inter,sans-serif",marginLeft:3}}>AI Advisor</span></h2><p style={{color:SLATE,fontSize:11,marginTop:2}}>{t.professionalAnalysis}</p></div>
          </div>
          <p style={{fontSize:10,fontWeight:600,color:MUTED,letterSpacing:1,textTransform:"uppercase",marginBottom:8}}>{t.responseLanguage}</p>
          <div style={{display:"flex",gap:6,overflowX:"auto",paddingBottom:2}}>
            {LANGS.map(l=>(
              <button key={l.code} onClick={()=>{setAriaLang(l.code);setAnalyzed(false);setMsgs([]);}} style={{flexShrink:0,padding:"5px 11px",borderRadius:8,border:`1.5px solid ${ariaLang===l.code?NAVY:BORDER}`,background:ariaLang===l.code?NAVY:WHITE,color:ariaLang===l.code?WHITE:SLATE,cursor:"pointer",fontSize:11,fontWeight:600,transition:"all .15s",whiteSpace:"nowrap"}}>
                {l.flag} {l.label}
              </button>
            ))}
          </div>
        </div>
        <div style={{flex:1,overflowY:"auto",display:"flex",flexDirection:"column",gap:13,marginBottom:18}}>
          {msgs.length===0&&!cLoading&&(
            <div style={{textAlign:"center",padding:"28px 14px"}}>
              <div style={{width:60,height:60,borderRadius:17,background:`linear-gradient(135deg,${NAVY},${NAVY2})`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:26,margin:"0 auto 18px"}}>✦</div>
              <p style={{fontFamily:"'Playfair Display',serif",fontSize:17,fontWeight:700,marginBottom:8}}>{ariaT.helloIAmARIA}</p>
              <p style={{color:SLATE,fontSize:13,lineHeight:1.8,marginBottom:24}}>{ariaT.ariaDesc}</p>
              <button className="btn-p" onClick={analyze} style={{width:"100%",padding:14,borderRadius:11,fontSize:13}}>{ariaT.analyzePortfolio}</button>
            </div>
          )}
          {msgs.filter(m=>!m.hidden).map((m,i)=>(
            <div key={i} style={{animation:"fadeIn .3s ease both",animationDelay:`${i*.05}s`,display:"flex",gap:9,alignItems:"flex-start",flexDirection:m.role==="user"?"row-reverse":"row"}}>
              {m.role==="assistant"&&<div style={{width:30,height:30,borderRadius:9,background:`linear-gradient(135deg,${NAVY},${NAVY2})`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:13,flexShrink:0}}>✦</div>}
              <div style={{maxWidth:"82%",padding:"12px 15px",borderRadius:m.role==="user"?"15px 15px 4px 15px":"15px 15px 15px 4px",background:m.role==="user"?NAVY:WHITE,color:m.role==="user"?WHITE:TEXT,fontSize:13,lineHeight:1.7,border:m.role==="user"?"none":`1px solid ${BORDER}`,fontWeight:m.role==="user"?500:400}}>{m.content}</div>
            </div>
          ))}
          {cLoading&&<div style={{display:"flex",gap:9,alignItems:"flex-start"}}><div style={{width:30,height:30,borderRadius:9,background:`linear-gradient(135deg,${NAVY},${NAVY2})`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:13,flexShrink:0}}>✦</div><div style={{padding:"13px 16px",background:WHITE,border:`1px solid ${BORDER}`,borderRadius:"15px 15px 15px 4px",display:"flex",gap:5,alignItems:"center"}}><div className="dot"/><div className="dot"/><div className="dot"/></div></div>}
          <div ref={endRef}/>
        </div>
        {analyzed&&!cLoading&&<div style={{display:"flex",gap:7,overflowX:"auto",paddingBottom:9,flexShrink:0}}>{(ariaT.suggestions||[]).map((s,i)=><button key={i} className="sugg" onClick={()=>setCInput(s)}>{s}</button>)}</div>}
        {analyzed&&<button onClick={analyze} style={{background:"transparent",border:`1px solid ${BORDER}`,borderRadius:9,padding:9,fontSize:12,color:MUTED,cursor:"pointer",marginBottom:9,flexShrink:0}}>{ariaT.reanalyze}</button>}
        {analyzed&&<div style={{display:"flex",gap:9,flexShrink:0}}>
          <input className="inp" value={cInput} onChange={e=>setCInput(e.target.value)} onKeyDown={e=>e.key==="Enter"&&send()} placeholder={ariaT.askARIA} style={{flex:1,borderRadius:9}}/>
          <button onClick={send} disabled={!cInput.trim()||cLoading} style={{width:44,height:44,borderRadius:9,border:`1px solid ${cInput.trim()&&!cLoading?NAVY:BORDER}`,cursor:"pointer",flexShrink:0,background:cInput.trim()&&!cLoading?NAVY:WHITE,color:cInput.trim()&&!cLoading?WHITE:MUTED,fontSize:17,transition:"all .15s"}}>↑</button>
        </div>}
      </div>
    )}

    {/* ACCOUNT */}
    {tab==="more"&&(
      <div className="fade" style={{padding:"24px 20px 0"}}>
        <p style={{fontSize:10,color:SLATE,fontWeight:600,letterSpacing:1.2,textTransform:"uppercase",marginBottom:4}}>{t.account}</p>
        <h2 style={{fontFamily:"'Playfair Display',serif",fontSize:22,fontWeight:700,marginBottom:18}}>{t.myAccount}</h2>
        <div className="card" style={{marginBottom:14,padding:18}}>
          <div style={{display:"flex",alignItems:"center",gap:13,marginBottom:14}}>
            <div style={{width:50,height:50,borderRadius:13,background:NAVY,display:"flex",alignItems:"center",justifyContent:"center",color:GOLD,fontWeight:700,fontSize:21,flexShrink:0}}>{user.name.charAt(0).toUpperCase()}</div>
            <div style={{flex:1}}>
              <p style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:16,color:TEXT}}>{user.name}</p>
              <p style={{color:MUTED,fontSize:12,marginTop:2}}>{user.email}</p>
              <span style={{fontSize:10,fontWeight:600,padding:"2px 7px",borderRadius:5,background:`${currentPlan.color}18`,color:currentPlan.color,border:`1px solid ${currentPlan.color}30`,marginTop:4,display:"inline-block"}}>{currentPlan.name}</span>
            </div>
            <button onClick={onLogout} style={{border:"1px solid #FECACA",background:"#FEF2F2",borderRadius:8,padding:"7px 11px",fontSize:11,fontWeight:600,color:"#DC2626",cursor:"pointer"}}>{t.signOut}</button>
          </div>
          <div style={{height:1,background:BORDER,margin:"4px 0 14px"}}/>
          <div style={{display:"flex",justifyContent:"space-around"}}>
            {[[totalSaved.toLocaleString()+" "+currency.symbol,t.totalSaved],[projects.length,t.goals],[currentPlan.name,t.plan]].map(([val,label],i)=>(
              <div key={i} style={{textAlign:"center"}}>
                <p style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:15,color:TEXT}}>{val}</p>
                <p style={{fontSize:10,color:MUTED,fontWeight:500,marginTop:2}}>{label}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Admin access button */}
        <button onClick={() => setShowAdminLogin(true)} style={{ width: "100%", background: "rgba(201,168,76,.08)", border: `1px solid ${GOLD}30`, borderRadius: 14, padding: "14px 18px", cursor: "pointer", display: "flex", alignItems: "center", gap: 12, marginBottom: 14, fontFamily: "Inter,sans-serif" }}>
          <div style={{ width: 40, height: 40, borderRadius: 11, background: `${GOLD}15`, border: `1px solid ${GOLD}30`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 18, flexShrink: 0 }}>🛡️</div>
          <div style={{ flex: 1, textAlign: "left" }}>
            <p style={{ fontWeight: 700, fontSize: 14, color: TEXT }}>Espace Administrateur</p>
            <p style={{ fontSize: 11, color: MUTED, marginTop: 1 }}>Statistiques, utilisateurs, paiements</p>
          </div>
          <span style={{ color: MUTED, fontSize: 18 }}>›</span>
        </button>

        {/* Language setting */}
        <div className="card" style={{marginBottom:14,padding:18}}>
          <p style={{fontSize:10,fontWeight:600,color:SLATE,letterSpacing:1.2,textTransform:"uppercase",marginBottom:14}}>{t.selectLanguage}</p>
          <button onClick={()=>setShowLangPicker(true)} style={{width:"100%",border:`1.5px solid ${BORDER}`,borderRadius:12,padding:"14px 16px",background:WHITE,cursor:"pointer",display:"flex",alignItems:"center",gap:12,transition:"all .2s"}}>
            <span style={{fontSize:22}}>{LANGS.find(l=>l.code===lang)?.flag}</span>
            <div style={{flex:1,textAlign:"left"}}>
              <p style={{fontWeight:600,fontSize:14,color:TEXT}}>{LANGS.find(l=>l.code===lang)?.label}</p>
              <p style={{fontSize:11,color:MUTED,marginTop:1}}>{t.languageChanged.includes("updated")?"Click to change language":"Cliquez pour changer"}</p>
            </div>
            <span style={{color:MUTED,fontSize:18}}>›</span>
          </button>
        </div>

        {/* Plans */}
        <div className="card" style={{marginBottom:14,padding:18}}>
          <p style={{fontSize:10,fontWeight:600,color:SLATE,letterSpacing:1.2,textTransform:"uppercase",marginBottom:14}}>{t.subscriptionPlans}</p>
          <div style={{display:"flex",flexDirection:"column",gap:9}}>
            {PLANS.map((p,idx)=>{
              const isActive=plan===p.id;
              const features=(t.planFeatures||{})[p.id]||[];
              return(
                <div key={p.id} onClick={()=>setShowPlanDetail({...p,price:PLAN_PRICES[idx],features})} style={{border:`1.5px solid ${isActive?p.color:BORDER}`,borderRadius:11,padding:"13px 15px",cursor:"pointer",background:isActive?`${p.color}06`:WHITE,transition:"all .2s"}}>
                  <div style={{display:"flex",justifyContent:"space-between",alignItems:"center"}}>
                    <div style={{display:"flex",gap:7,alignItems:"center"}}>
                      <p style={{fontWeight:600,fontSize:13,color:isActive?p.color:TEXT}}>{p.name}</p>
                      {p.popular&&<span style={{fontSize:9,fontWeight:700,padding:"2px 6px",borderRadius:4,background:"#EFF6FF",color:"#1D4ED8"}}>{t.popular}</span>}
                      {isActive&&<span style={{fontSize:9,fontWeight:700,padding:"2px 6px",borderRadius:4,background:`${p.color}18`,color:p.color}}>{t.active}</span>}
                    </div>
                    <p style={{fontWeight:700,fontSize:12,color:isActive?p.color:TEXT}}>{PLAN_PRICES[idx]}</p>
                  </div>
                  <p style={{fontSize:11,color:MUTED,marginTop:3}}>{features[0]} · {t.withdrawalFee2} {p.fee}</p>
                </div>
              );
            })}
          </div>
        </div>

        {/* Upcoming */}
        <div className="card" style={{marginBottom:14,padding:18}}>
          <p style={{fontSize:10,fontWeight:600,color:SLATE,letterSpacing:1.2,textTransform:"uppercase",marginBottom:14}}>{t.comingSoon}</p>
          {(t.upcoming||[]).map((f,i)=>(
            <div key={i} style={{display:"flex",gap:11,alignItems:"flex-start",marginBottom:i<(t.upcoming.length-1)?12:0}}>
              <div style={{width:34,height:34,borderRadius:9,background:`${NAVY}06`,border:`1px solid ${NAVY}10`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:15,flexShrink:0}}>{f.icon}</div>
              <div style={{flex:1}}><p style={{fontWeight:600,fontSize:12,marginBottom:1,color:TEXT}}>{f.label}</p><p style={{color:MUTED,fontSize:11}}>{f.desc}</p></div>
              <span style={{fontSize:9,fontWeight:700,padding:"2px 7px",borderRadius:4,background:LIGHT,color:MUTED,border:`1px solid ${BORDER}`,flexShrink:0,marginTop:2}}>SOON</span>
            </div>
          ))}
        </div>

        <div style={{display:"flex",flexDirection:"column",gap:7,marginBottom:22}}>
          {[[`⚖️`,t.legalCompliance,t.kycAml],[`🔐`,t.securityCenter,t.authData],[`❓`,t.helpSupport,t.faqContact]].map(([icon,title,desc],i)=>(
            <button key={i} onClick={()=>notify(t.comingSoonMsg)} style={{display:"flex",alignItems:"center",gap:13,padding:"13px 16px",background:WHITE,border:`1px solid ${BORDER}`,borderRadius:12,cursor:"pointer",textAlign:"left",width:"100%"}}>
              <div style={{width:36,height:36,borderRadius:9,background:LIGHT,border:`1px solid ${BORDER}`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:15}}>{icon}</div>
              <div style={{flex:1}}><p style={{fontWeight:600,fontSize:13,marginBottom:1,color:TEXT}}>{title}</p><p style={{color:MUTED,fontSize:11}}>{desc}</p></div>
              <span style={{color:MUTED,fontSize:17}}>›</span>
            </button>
          ))}
        </div>
        <div style={{textAlign:"center",paddingBottom:6}}>
          <p style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:14,color:TEXT}}>Pro<span style={{color:GOLD}}>.G</span></p>
          <p style={{color:MUTED,fontSize:10,marginTop:3}}>{t.version}</p>
        </div>
      </div>
    )}
  </div>

  {/* TAB BAR */}
  <div className="tab-bar">
    {TABS_TRANSLATED.map(tb=>(
      <button key={tb.id} className={`tab-item ${tab===tb.id?"active":""}`} onClick={()=>setTab(tb.id)}>
        <span className="tab-icon" style={{color:tab===tb.id?NAVY:MUTED}}>{tb.icon}</span>{tb.label}
      </button>
    ))}
  </div>

  {/* Plan detail sheet */}
  {showPlanDetail&&(
    <div className="overlay" onClick={()=>setShowPlanDetail(null)}>
      <div className="sheet" onClick={e=>e.stopPropagation()}>
        <div style={{width:34,height:4,background:BORDER,borderRadius:99,margin:"0 auto 22px"}}/>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:18}}>
          <div>
            <div style={{display:"flex",gap:7,alignItems:"center",marginBottom:5}}>
              <h3 style={{fontFamily:"'Playfair Display',serif",fontSize:21,fontWeight:700}}>{showPlanDetail.name}</h3>
              {showPlanDetail.popular&&<span style={{fontSize:9,fontWeight:700,padding:"2px 8px",borderRadius:4,background:"#EFF6FF",color:"#1D4ED8"}}>{t.popular}</span>}
            </div>
            <p style={{fontFamily:"'Playfair Display',serif",fontSize:24,fontWeight:700,color:showPlanDetail.color}}>{showPlanDetail.price}</p>
          </div>
          <button onClick={()=>setShowPlanDetail(null)} style={{border:`1px solid ${BORDER}`,background:LIGHT,borderRadius:99,width:30,height:30,cursor:"pointer",fontSize:14,color:SLATE}}>✕</button>
        </div>
        <div style={{background:LIGHT,borderRadius:11,padding:"11px 14px",marginBottom:18,border:`1px solid ${BORDER}`}}>
          <p style={{fontSize:12,color:SLATE}}>{t.withdrawalFee}: <strong style={{color:TEXT}}>{showPlanDetail.fee}</strong> · {t.processing}: <strong style={{color:TEXT}}>{showPlanDetail.withdrawal}</strong></p>
        </div>
        <Lbl dir={dir}>{t.planIncludes}</Lbl>
        <div style={{display:"flex",flexDirection:"column",gap:9,marginBottom:22,marginTop:8}}>
          {(showPlanDetail.features||[]).map((ft,i)=>(
            <div key={i} style={{display:"flex",gap:9,alignItems:"center"}}>
              <div style={{width:19,height:19,borderRadius:99,background:`${showPlanDetail.color}15`,border:`1px solid ${showPlanDetail.color}30`,display:"flex",alignItems:"center",justifyContent:"center",flexShrink:0}}><span style={{fontSize:10,color:showPlanDetail.color,fontWeight:700}}>✓</span></div>
              <span style={{fontSize:13,color:TEXT}}>{ft}</span>
            </div>
          ))}
        </div>
        {plan!==showPlanDetail.id?(
          <button className="btn-p" onClick={()=>{setPlan(showPlanDetail.id);setShowPlanDetail(null);notify(`${showPlanDetail.name} ${t.activated}`);}} style={{width:"100%",padding:14,borderRadius:11,background:showPlanDetail.color}}>{t.selectPlan}</button>
        ):(
          <div style={{textAlign:"center",padding:13,background:"#F0FDF4",borderRadius:11,border:"1px solid #BBF7D0"}}><p style={{fontWeight:600,fontSize:13,color:"#15803D"}}>✓ {t.currentPlan}</p></div>
        )}
      </div>
    </div>
  )}

  {/* Deposit personal */}
  {activeProject&&(
    <div className="overlay" onClick={()=>{setActiveProject(null);setDeposit("");}}>
      <div className="sheet" onClick={e=>e.stopPropagation()}>
        <div style={{width:34,height:4,background:BORDER,borderRadius:99,margin:"0 auto 22px"}}/>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:18}}>
          <div>
            <p style={{fontSize:10,color:SLATE,fontWeight:600,letterSpacing:1,textTransform:"uppercase",marginBottom:4}}>{t.savingsGoals}</p>
            <p style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:17}}>{activeProject.name}</p>
            <p style={{color:MUTED,fontSize:11,marginTop:2}}>{getCat(activeProject.category,lang).icon} {getCat(activeProject.category,lang).label} · {getCur(activeProject.currency).flag} {activeProject.currency}</p>
          </div>
          <button onClick={()=>{setActiveProject(null);setDeposit("");}} style={{border:`1px solid ${BORDER}`,background:LIGHT,borderRadius:99,width:30,height:30,cursor:"pointer",fontSize:14,color:SLATE}}>✕</button>
        </div>
        <div style={{background:LIGHT,borderRadius:13,padding:16,marginBottom:18,border:`1px solid ${BORDER}`}}>
          <div style={{display:"flex",justifyContent:"space-between",alignItems:"baseline",marginBottom:11}}>
            <span style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:20}}>{activeProject.saved.toLocaleString()} <span style={{color:MUTED,fontWeight:400,fontSize:13}}>{getCur(activeProject.currency).symbol}</span></span>
            <span style={{color:MUTED,fontSize:11}}>{t.of} {activeProject.goal.toLocaleString()} {getCur(activeProject.currency).symbol}</span>
          </div>
          <div className="prog-track"><div className={`prog-fill ${Math.round((activeProject.saved/activeProject.goal)*100)>=100?"done":""}`} style={{width:`${Math.min(100,Math.round((activeProject.saved/activeProject.goal)*100))}%`}}/></div>
          <p style={{fontSize:11,color:MUTED,marginTop:7,fontWeight:500}}>{Math.min(100,Math.round((activeProject.saved/activeProject.goal)*100))}% · {(activeProject.goal-activeProject.saved).toLocaleString()} {getCur(activeProject.currency).symbol} {t.remaining}</p>
        </div>
        <Lbl dir={dir}>{t.depositAmount} ({activeProject.currency})</Lbl>
        <input className="inp" type="number" placeholder="0.00" value={deposit} onChange={e=>setDeposit(e.target.value)} style={{fontSize:20,fontWeight:700,marginBottom:11,marginTop:4}}/>
        <div style={{display:"flex",gap:7,marginBottom:18}}>{[50,100,500,1000].map(a=><button key={a} onClick={()=>setDeposit(String(a))} style={{flex:1,border:`1.5px solid ${deposit===String(a)?NAVY:BORDER}`,borderRadius:8,background:deposit===String(a)?NAVY:WHITE,color:deposit===String(a)?WHITE:SLATE,padding:"8px 0",fontSize:11,fontWeight:600,cursor:"pointer",transition:"all .15s"}}>${a}</button>)}</div>
        <button className="btn-p" onClick={handleDeposit} style={{width:"100%",padding:14,borderRadius:11}}>{t.confirmDeposit} {deposit?`— ${parseFloat(deposit||0).toLocaleString()} ${activeProject.currency}`:""}</button>
        <p style={{textAlign:"center",fontSize:11,color:MUTED,marginTop:9}}>{t.withdrawalFee}: {currentPlan.fee}</p>
      </div>
    </div>
  )}

  {/* Group deposit */}
  {activeCol&&(
    <div className="overlay" onClick={()=>{setActiveCol(null);setColDeposit("");setInviteEmail("");}}>
      <div className="sheet" onClick={e=>e.stopPropagation()}>
        <div style={{width:34,height:4,background:BORDER,borderRadius:99,margin:"0 auto 22px"}}/>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:18}}>
          <div>
            <p style={{fontSize:10,color:SLATE,fontWeight:600,letterSpacing:1,textTransform:"uppercase",marginBottom:4}}>{t.groupSavings}</p>
            <p style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:17}}>{activeCol.name}</p>
            <p style={{color:MUTED,fontSize:11,marginTop:2}}>👥 {activeCol.members.length} members · Code: <strong>{activeCol.code}</strong></p>
          </div>
          <button onClick={()=>{setActiveCol(null);setColDeposit("");setInviteEmail("");}} style={{border:`1px solid ${BORDER}`,background:LIGHT,borderRadius:99,width:30,height:30,cursor:"pointer",fontSize:14,color:SLATE}}>✕</button>
        </div>
        {(()=>{const saved=getColSaved(activeCol),pct=Math.min(100,Math.round((saved/activeCol.goal)*100));return(<div style={{background:LIGHT,borderRadius:13,padding:16,marginBottom:18,border:`1px solid ${BORDER}`}}><div style={{display:"flex",justifyContent:"space-between",alignItems:"baseline",marginBottom:11}}><span style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:20}}>{saved.toLocaleString()} <span style={{color:MUTED,fontWeight:400,fontSize:13}}>{getCur(activeCol.currency).symbol}</span></span><span style={{color:MUTED,fontSize:11}}>{t.of} {activeCol.goal.toLocaleString()} {getCur(activeCol.currency).symbol}</span></div><div className="prog-track"><div className={`prog-fill ${pct>=100?"done":""}`} style={{width:`${pct}%`}}/></div><p style={{fontSize:11,color:MUTED,marginTop:7,fontWeight:500}}>{pct}%</p></div>);})()}
        <Lbl dir={dir}>{t.memberContributions}</Lbl>
        <div style={{display:"flex",flexDirection:"column",gap:7,marginBottom:18,marginTop:6}}>
          {activeCol.members.map((m,i)=>{const total=getMyTotal(activeCol,m.email);return(<div key={i} style={{display:"flex",alignItems:"center",gap:11,padding:"11px 13px",background:LIGHT,borderRadius:9,border:`1px solid ${BORDER}`}}><div style={{width:30,height:30,borderRadius:8,background:NAVY,display:"flex",alignItems:"center",justifyContent:"center",color:GOLD,fontWeight:700,fontSize:12,flexShrink:0}}>{m.name.charAt(0).toUpperCase()}</div><div style={{flex:1}}><p style={{fontWeight:600,fontSize:12,color:TEXT}}>{m.name}{m.email===user.email?" (you)":""}</p><p style={{color:MUTED,fontSize:10}}>{m.email}</p></div><span style={{fontFamily:"'Playfair Display',serif",fontWeight:700,fontSize:13}}>{total.toLocaleString()} {getCur(activeCol.currency).symbol}</span></div>);})}
        </div>
        <Lbl dir={dir}>{t.myDeposit} ({activeCol.currency})</Lbl>
        <input className="inp" type="number" placeholder="0.00" value={colDeposit} onChange={e=>setColDeposit(e.target.value)} style={{fontSize:20,fontWeight:700,marginBottom:11,marginTop:4}}/>
        <div style={{display:"flex",gap:7,marginBottom:14}}>{[50,100,500,1000].map(a=><button key={a} onClick={()=>setColDeposit(String(a))} style={{flex:1,border:`1.5px solid ${colDeposit===String(a)?NAVY:BORDER}`,borderRadius:8,background:colDeposit===String(a)?NAVY:WHITE,color:colDeposit===String(a)?WHITE:SLATE,padding:"8px 0",fontSize:11,fontWeight:600,cursor:"pointer",transition:"all .15s"}}>${a}</button>)}</div>
        <button className="btn-p" onClick={handleColDeposit} style={{width:"100%",padding:14,borderRadius:11,marginBottom:18}}>{t.confirmDeposit}</button>
        <Lbl dir={dir}>{t.inviteMembers}</Lbl>
        <div style={{background:"#EFF6FF",borderRadius:11,padding:"12px 15px",marginBottom:11,marginTop:6,display:"flex",alignItems:"center",justifyContent:"space-between",border:"1px solid #BFDBFE"}}>
          <div><p style={{fontSize:10,color:"#1D4ED8",fontWeight:600,marginBottom:2}}>{t.invitationCode}</p><p style={{fontWeight:800,fontSize:20,letterSpacing:3,color:TEXT}}>{activeCol.code}</p></div>
          <button onClick={()=>{navigator.clipboard?.writeText(activeCol.code);notify(t.copied);}} style={{background:"#1D4ED8",color:WHITE,border:"none",borderRadius:8,padding:"8px 12px",fontSize:12,fontWeight:600,cursor:"pointer"}}>{t.copy}</button>
        </div>
        <div style={{display:"flex",gap:9}}>
          <input className="inp" type="email" placeholder="email@example.com" value={inviteEmail} onChange={e=>setInviteEmail(e.target.value)} style={{flex:1}}/>
          <button onClick={()=>{if(!inviteEmail.includes("@"))return notify(t.invalidEmail,"err");notify(`${t.inviteSent} ${inviteEmail}`);setInviteEmail("");}} style={{background:NAVY,color:WHITE,border:"none",borderRadius:9,padding:"0 14px",fontSize:12,fontWeight:600,cursor:"pointer",whiteSpace:"nowrap"}}>{t.invite}</button>
        </div>
      </div>
    </div>
  )}

  {/* New goal */}
  {showNew&&(
    <div className="overlay" onClick={()=>setShowNew(false)}>
      <div className="sheet" onClick={e=>e.stopPropagation()}>
        <div style={{width:34,height:4,background:BORDER,borderRadius:99,margin:"0 auto 22px"}}/>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:20}}><h3 style={{fontFamily:"'Playfair Display',serif",fontSize:19,fontWeight:700}}>{t.newSavingsGoal}</h3><button onClick={()=>setShowNew(false)} style={{border:`1px solid ${BORDER}`,background:LIGHT,borderRadius:99,width:30,height:30,cursor:"pointer",fontSize:14,color:SLATE}}>✕</button></div>
        <div style={{display:"flex",flexDirection:"column",gap:14}}>
          <div><Lbl dir={dir}>{t.goalName}</Lbl><input className="inp" placeholder={t.goalNamePlaceholder} value={form.name} onChange={e=>setForm(f=>({...f,name:e.target.value}))}/></div>
          <div><Lbl dir={dir}>{t.category}</Lbl><div style={{display:"flex",flexWrap:"wrap",gap:7,marginTop:4}}>{CATEGORIES.map((cat,ci)=>{const label=(CAT_LABELS[lang]||CAT_LABELS.en)[ci];return(<button key={cat.id} className={`cat-btn ${form.category===cat.id?"active":""}`} onClick={()=>setForm(f=>({...f,category:cat.id}))}>{cat.icon} {label}</button>)})}</div></div>
          <div style={{display:"grid",gridTemplateColumns:"1fr 1fr",gap:9}}>
            <div><Lbl dir={dir}>{t.currency2}</Lbl><select className="inp" value={form.currency} onChange={e=>setForm(f=>({...f,currency:e.target.value}))} style={{marginTop:4}}>{CURRENCIES.map(c=><option key={c.code} value={c.code}>{c.flag} {c.code}</option>)}</select></div>
            <div><Lbl dir={dir}>{t.targetAmount}</Lbl><input className="inp" type="number" placeholder="50,000" value={form.goal} onChange={e=>setForm(f=>({...f,goal:e.target.value}))} style={{marginTop:4}}/></div>
          </div>
          <div><Lbl dir={dir}>{t.targetDate}</Lbl><input className="inp" type="date" value={form.deadline} onChange={e=>setForm(f=>({...f,deadline:e.target.value}))} style={{marginTop:4}}/></div>
          <button className="btn-p" onClick={handleCreate} style={{width:"100%",padding:14,borderRadius:11,marginTop:3}}>{t.createGoal}</button>
        </div>
      </div>
    </div>
  )}

  {/* New group */}
  {showNewCol&&(
    <div className="overlay" onClick={()=>setShowNewCol(false)}>
      <div className="sheet" onClick={e=>e.stopPropagation()}>
        <div style={{width:34,height:4,background:BORDER,borderRadius:99,margin:"0 auto 22px"}}/>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:14}}><h3 style={{fontFamily:"'Playfair Display',serif",fontSize:19,fontWeight:700}}>{t.createGroupTitle}</h3><button onClick={()=>setShowNewCol(false)} style={{border:`1px solid ${BORDER}`,background:LIGHT,borderRadius:99,width:30,height:30,cursor:"pointer",fontSize:14,color:SLATE}}>✕</button></div>
        <div style={{background:"#EFF6FF",borderRadius:11,padding:"11px 14px",marginBottom:18,border:"1px solid #BFDBFE"}}><p style={{fontSize:12,color:"#1D4ED8",fontWeight:500}}>👥 {t.autoGenCode}</p></div>
        <div style={{display:"flex",flexDirection:"column",gap:14}}>
          <div><Lbl dir={dir}>{t.goalName}</Lbl><input className="inp" placeholder={t.groupNamePlaceholder} value={colForm.name} onChange={e=>setColForm(f=>({...f,name:e.target.value}))}/></div>
          <div><Lbl dir={dir}>{t.category}</Lbl><div style={{display:"flex",flexWrap:"wrap",gap:7,marginTop:4}}>{CATEGORIES.map((cat,ci)=>{const label=(CAT_LABELS[lang]||CAT_LABELS.en)[ci];return(<button key={cat.id} className={`cat-btn ${colForm.category===cat.id?"active":""}`} onClick={()=>setColForm(f=>({...f,category:cat.id}))}>{cat.icon} {label}</button>)})}</div></div>
          <div style={{display:"grid",gridTemplateColumns:"1fr 1fr",gap:9}}>
            <div><Lbl dir={dir}>{t.currency2}</Lbl><select className="inp" value={colForm.currency} onChange={e=>setColForm(f=>({...f,currency:e.target.value}))} style={{marginTop:4}}>{CURRENCIES.map(c=><option key={c.code} value={c.code}>{c.flag} {c.code}</option>)}</select></div>
            <div><Lbl dir={dir}>{t.targetAmount}</Lbl><input className="inp" type="number" placeholder="10,000" value={colForm.goal} onChange={e=>setColForm(f=>({...f,goal:e.target.value}))} style={{marginTop:4}}/></div>
          </div>
          <div><Lbl dir={dir}>{t.targetDate}</Lbl><input className="inp" type="date" value={colForm.deadline} onChange={e=>setColForm(f=>({...f,deadline:e.target.value}))} style={{marginTop:4}}/></div>
          <button className="btn-p" onClick={handleCreateCol} style={{width:"100%",padding:14,borderRadius:11}}>{t.createGroupTitle}</button>
        </div>
      </div>
    </div>
  )}

  {/* Join group */}
  {showJoin&&(
    <div className="overlay" onClick={()=>setShowJoin(false)}>
      <div className="sheet" onClick={e=>e.stopPropagation()}>
        <div style={{width:34,height:4,background:BORDER,borderRadius:99,margin:"0 auto 22px"}}/>
        <div style={{display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:18}}><h3 style={{fontFamily:"'Playfair Display',serif",fontSize:19,fontWeight:700}}>{t.joinGroupTitle}</h3><button onClick={()=>setShowJoin(false)} style={{border:`1px solid ${BORDER}`,background:LIGHT,borderRadius:99,width:30,height:30,cursor:"pointer",fontSize:14,color:SLATE}}>✕</button></div>
        <p style={{color:SLATE,fontSize:13,lineHeight:1.6,marginBottom:20}}>{t.enterCode}</p>
        <Lbl dir={dir}>{t.invitationCode}</Lbl>
        <input className="inp" placeholder="A1B2C3" value={joinCode} onChange={e=>setJoinCode(e.target.value.toUpperCase())} style={{fontSize:22,fontWeight:800,letterSpacing:5,marginBottom:18,textAlign:"center",marginTop:4}}/>
        <button className="btn-p" onClick={handleJoinCol} style={{width:"100%",padding:14,borderRadius:11}}>{t.joinGroupBtn}</button>
      </div>
    </div>
  )}
</div>
```

);
}