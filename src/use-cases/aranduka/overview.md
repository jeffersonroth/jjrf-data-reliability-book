Online Media  Attribution Model

“If we have data, let’s look at data. If all we have are opinions, let’s go with mine”
— Jim Barksdale

For this exercise, let’s say we have a company, Aranduka Inc. They are a very established book store in Paraguay and have already gained a considerable share of the books e-commerce market in that country. Recently, they identified a good growth opportunity, by having a vertical of luxury school and office supplies products.

The company decided to create an App to work with the new vertical, the ArandukApp, an app that offers planners, journals, notebooks, calendars, and other cool premium school and office supplies. Aranduka maintains three apps: iOS, Android, Web.

ArandukApp delivers its products using its own delivery service. The person working to deliver the products is the Itamembeyku, Ita for short.

Let’s simplify the user’s acquisition path like the following:

The user is given a User ID when they complete the registration process. They could register using the App or the Web page.

From an acquisition perspective, a Conversion is when the user completes their first purchase, which we’ll call an Order. The first order to be finished (whether delivered or canceled with charges), will be considered the First Order.

Now consider the user acquisition media channels consists of:

Display Channels: Google UAC, and a Programmatic DSP platform.

SEM Channels: Google Search, and Apple Search Ads ASA.

Paid Social Channels: Facebook Ads, and Twitter.

Referrals and Influencers links.

Partnerships links.

In short, we’ll have 6 squads (Display, SEM, Paid Social, Referrals, Influencers, and Partnerships), and we’ll call their channels (Facebook, Google UAC, etc.), Media Sources.

Next, let’s define the events we want to attribute, and the data sources.

Events
Install
Appsflyer will assign an Appsflyer ID to track the install event, and once the user registers through the app, or log in, we’ll be able to map the install to a user.

Order
Purchase event. If it’s the first order to be completed (successfully delivered or canceled with charges), it’ll be considered a First Order. The next completed orders will be classified as Retention.

Register
A Register event can be completed by verifying a user's email, phone number, or logging in through social media (Facebook, Google, Apple).

Other
Login, App Launch, View Home, Select Store, Select Product, Proceed to Checkout, and many others. Won't be part of the main Acquisition Funnel, but the data will be used in different steps od the pipeline.

Attribution Inputs
Attribution touchpoints data will be the main star of the Online Media Attribution pipeline. The touchpoints may come mainly from impressions and clicks events.

Appsflyer
Appsflyer shares Installs and InApp events data, providing the Media Source, and the Campaign information of the touchpoint they believe to be the most relevant to the event.

Google Analytics
GA shares users sessions, sessions, and transaction data, with medium / source / channel information. Here we can detect SEO and Google UAC / SEM campaigns as well.

Business & Operations
Coverage
ArandukApp will operate in Paraguay. We’ll divide the operation’s coverage in City Scores from 1 to 5. City Scores 2-3 will have normal operations in the sense the user orders through the app, schedules the delivery date, and an Ita will deliver it personally.

City Scores 4 and 5 volumes won’t justify this business model, so the minimum purchases are higher, and the user will receive it via mail.

City Score 1: Asunción D.C.

City Score 2: Ciudad del Este, San Lorenzo, Luque, Encarnación.

City Score 3: Capiatá, Lambaré, Fernando de la Mora, Limpio, Ñemby, Mariano Roque Alonso, Villa Elisa, Caaguazú, Coronel Oviedo.

City Score 4: Hernandarias, Presidente Franco, Itaguá, Concepción, Villarrica, San Antonio, Itá, Minga Guazú.

City Score 5: Pilar, Caacupé, Villa Hayes, Villeta, Areguá.

Cities with scores 1 and 2, will have a subdivision in Microzones, also from 1 to 5, being 1 the microzones with the highest income, and other operational and financial justifying it to be the priority. Cities with City Score 3-5, will be assigned a Microzone Score equal to their City Score. The best combination would be City Score 1 and Microzone Score 1.

User Quality
Along with the City and Microzone Scores, the devices used to install the app, complete the registration process and make orders will also receive a score, the Device Score, also ranging from 1 to 5.

A combination of all those scores, with other financial information of the order (payment method, vertical, GMV) will categorize the user in:

UHVU - Ultra High-Level User.

HVU - High-Level User.

MVU - Mid-Value User.

LVU - Low-Value User.

Verticals
Paper: notebooks, planners, refill sheets, journals, binders, dividers, folders.

Special: calendars, inspirational journals, decorative journals, photo albums, planner accessories, sketchbooks, specialty journals, stickers, pins, cards.

Collections: school collections, university collections, professional collections, specialty collections, refill collections, partnerships (premium pen & pencils).

Whitelabel: schools, universities, and business Whitelabel. Available through the Web page.

Services: special sizes impressions, custom calendars, custom business products. Available only for cities score 1 and 2.

“Data are just summaries of thousands of stories – tell a few of those stories to help make the data meaningful”
— Chip & Dan Heath
View fullsize
ArandukApp’s Online Media Attribution Model - Kickoff
ArandukApp’s Online Media Attribution Model - Kickoff

Finally, we can start designing our Online Media Attribution Model for ArandukApp.

User’s Touchpoints
AF Installs
Appsflyer Installs data won’t tell us the ArandukApp’s User ID. It does provide an Appsflyer ID, an ID they’ll provide when the user opens the app for the first time. Whenever a user registers or fires an inapp event (login, launch, etc.), we’ll be able to attribute an install to a user.

AF App Events
Appsflyer will try and attribute the media source and campaign most relevant to the user action. For programmatic sources, for example, they’ll have the touchpoints pointing to the user’s device or Appsflyer ID. For Facebook and Google, due to users privacy regulations, they’ll ping the media source to check if the user’s was touched by any ad.

AF Clicks & Impressions
For the media sources not restricting user’s data, or for internal campaigns (OneLink), AF will provide us a table with the touchpoint details, as media, campaign, creative or ad, touch type, touch timestamp, and the user’s unique identifiers, like IDFA or Advertising ID.

AF P360 (Fraud)
Also, we’ll have access to the touchpoints AF couldn’t block due to fraud, giving us details of the timestamp, and fraud reason. With this data, we can manually remove the fraudulent touchpoints, keeping the touchpoints data to be consumed by the model clean and more reliable.

Attribution Business Rules
Now that we have the media touchpoints data available, let’s define the business rules to prioritize the attribution. Due to the business internal decisions, we’ll have the following prioritization:

Partnerships. [Installs, Registers, Orders]

Referrals. [Installs, Registers, Orders]

Influencers. [Installs, Registers, Orders]

Google Analytics’ Google campaigns (UAC / SEM). [Registers, Orders]

Last Clicks (7 Days). [Installs, Registers, Orders]

Last Impressions (1 Day). [Installs, Registers, Orders]

Most recent touchpoint (15 Days). [Installs, Registers, Orders]

Google Analytics’ SEO. [Registers, Orders]

Google Analytics’ Referrals. [Registers, Orders]

After 15 days, the touchpoints will still make it to the touchpoints table, but they won’t be used as input for the attribution process.

Partnerships
For example, the company Guaraní Inc. has a collection of notebooks and school planners with their art. They’ll have a link redirecting to the app (or app store), so their customer can purchase it through our app. Let’s say we’ll pay them:

$0.50 for installs or registers they generated, for device scores 1 and 2, in cities of score 1 and 2. $0.12 otherwise.

$3.00 for UHVU conversions, $2.00 for HVU conversions, $0.75 for MVU, and $0.25 for LVU.

The touchpoints generated by the clicks of the links the partner provides will be used as input for the Online Media Attribution Model.

The partner will also have available coupons for users to have discounts on their first order. Those coupons will be used as input for the Acquisition Funnel Model, which includes squads other than online media.

Referrals
Customers can access their profile and check their referral code, and share it with friends, through any social media or messenger. When someone clicks the referral link and is guided to install the app, a referral touchpoint will be created. For the Acquisition Funnel Model, referral codes (or coupons) will also be used as input.

For every conversion the customer brings, they will receive $2.00 in ArandukApp’s Credit, to be used within the app.

Influencers
Influencers will be given a coupon code to be shared online, giving new users ArandukApp’s Credits to be used within the app. When someone clicks the Influencers link and is guided to install the app an Influencers touchpoint will be created. For the Acquisition Funnel Model, Influencers coupons will also be used as input.

For every conversion the Influencers bring, they will receive:

$3.00 for UHVU conversions, $2.00 for HVU conversions, $0.50 for MVU, and $0.10 for LVU.

Google Analytics
Google Analytics has the ability to detect UAC and SEM campaigns. When the web session results in an Order, those touchpoints will have priority over other online media like Facebook, Programmatic, and Google touchpoints attributed by Appsflyer.

Other touchpoints detected by GA aren’t really media sources, in the sense of there’s no squad creating campaigns, or paying third-party companies to acquire users. SEO “touchpoints“, for example, are sessions where the user proactively made a search in a search engine, like Google or DuckDuckGo, and clicked in a result, redirecting the user to ArandukApp’s web page.

Appsflyer’s Touchpoints
For any in-app event, Appflyer will say whether it had a media touchpoint associated with it or will flag it as Organic. Also, using the user’s unique identifiers, we can detect other touchpoints AF couldn’t.

We’ll prioritize clicks over impressions if the touchpoints happened up to 7 days before the event. If there’re no impressions from up to 24h before the event, or clicks in the last 7 days, the most recent touchpoint happening up to 15 days will be used. After 15 days, the touchpoints will be available in the user’s touchpoints table, but won’t be used as input in any model.

Events Attribution
Installs
Installs attribution process will consist basically of the Appsflyer Installs data, enriched with the Users Unique Identifiers Map, in order to attribute the install a User ID.
When the device performs its first in-app action (complete registration, login, or logged in launch app, in case of reinstall), we’ll be able to detect the user.

In many cases, an install will drive several users using the app (users with multiple accounts, or relatives sharing the same device to log in to the app). If it’s the first time a device installs the app, the first user to be mapped to it will be attributed to the install event.

In case it’s not the first time the app is installed on the device (update, reinstall), the user with the highest probability of being the main user of the device will be attributed to the install. The user’s attribution works something like this:

The user with more orders between the last install event and the actual one will be attributed.

In case there’re no orders made with the device between the last install event and the actual one will, the user with a registration event mapped to the device, with a timestamp more recent than the previous install, will be attributed.

The user with more orders mapped to the device, at any time, will be attributed to the install event.

In case none of the users mapped to the device has had an order event, the last user mapped to the device will be attributed.

For example, John and Mike live together and share an iPad. The iPad is normally logged in with John’s account, but from time to time Mike logs out of the application to log in with his account. Since the last install, Mike’s made more orders than John, so the install event will be attributed to Mike.

Registers
The Registers Attribution process starts with the backend data. Here we’ll have the User ID, the registration method, City Score, Microzone Score, Device Score, and other relevant information.

Then, we’ll fetch any touchpoint the user has attributed to the event and their devices, from AF and GA. With the touchpoint’s prioritization rules, we can detect the relevant touchpoints and attribute the squad, media source, and media delivery information.

Orders
The Orders Attribution process also starts with the backend data. Here we’ll have the User ID, the Order ID, the order Vertical, City Score, Microzone Score, Device Score, and other relevant order details.

Then, we’ll fetch any touchpoint the user has attributed to the event and their devices, from AF and GA. With the touchpoint’s prioritization rules, we can detect the relevant touchpoints and attribute the squad, media source, and media delivery information.

First Order (New Users) & Retention Orders
If it’s the first order a user has completed (order delivered, or canceled with charges), and counting to GMV. The event attribution data will be used as input of the User Acquisition Model. Otherwise, it’ll be used in the Retention Model.

Attributed Touchpoints Weights
One option, to have a very simple attribution model, would be to use only the main attributed touchpoint for an event, after it’s selected using the prioritization rules. The problem with this model would be to not have clarity on how the different media sources contribute to the event.

To have total clarity on the contribution of each media source to the conversion (Install, Register, Order), we’ll have to use all the touchpoints. In the easiest scenario, the event has attributed to it only one touchpoint. In this case, the attributed touchpoint will receive 100% of the conversion. This scenario is unlikely to happen often.

Given that in most cases the conversion will have multiple touchpoints attributed to it, we need a strategy to give the touchpoints weights. There are tons of available methods to do so: Markov Chains, Exponential Time Decay, and others.

Aranduka chose to go with the Markov Chains model. The model will receive as input all the valid touchpoints for the conversions, and also will have the prioritization rules built-in, to give the model a certain bias towards them.

The model output will be the percentage of attribution for each attributed touchpoint. For example, let’s say Maria has attributed 4 touchpoints to her first order conversion:

Influencers touchpoint, 15 minutes before the conversion.

Google SEM click 2 days before the conversion.

Facebook impression 6 hours before the conversion.

Centro DSP click 14 days before the conversion.

The model’s output for the given conversion would be something like this:

Influencers: 53%, or 0.53 users.

Google SEM: 24% or 0.24 users.

Facebook: 18% or 0.18 users.

Centro DSP: 5% or 0.05 users.

Media Delivery
Media sources will deliver campaigns, in order to acquire users, reactivate users, and for branding and brand awareness.

Aside from knowing which media source touchpoint influenced a user, the company must have control over the campaigns’ metrics (cost, impressions, and clicks), targets (country, region, city), and the campaigns’ structure (media account, campaign, ad set, ad, ad type, etc.).

In order to have the most granular data possible, for Facebook Ads, we’ll maintain a Facebook Ads API connection, making all the data available in our database. The same with Google and the Google Ads API. For the media sources that can’t offer an API for us to consume, or the volume of campaigns don¿t justify maintaining the connection, we’ll use the Singular platform, so the media sources can share the delivery data with us.

With this information, we’ll be able to attribute media costs to the media attribution events, like Cost per Install (CPI), Cost per Register (CPR), Cost per Order (CPO), and the most important media KPI, the Cost of User Acquisition (CAC). The squads will be able to check their performance daily, move budget, optimize campaigns and review their strategies.

“Without a systematic way to start and keep data clean, bad data will happen”
— Donato Dorio
Media Delivery ETLs
Now that the data is available, we need to clean and prepare the data to be used in the Online Media Attribution Model pipelines.

Granularity
Not all media sources are able to provide the delivery information with the same granularity. Google Ads can provide it by city. Facebook Ads can provide it by Region (State, Department, Province). The other media sources provide it by country only.

In order to normalize the delivery, we can maintain Campaigns, Ad Sets, and Ads naming conventions, that must be followed by the media squads when they set up the campaigns. Then we have to create a process to detect these naming conventions and assign the delivery data to the correct city. We must also be able to detect when campaigns are being delivered to the wrong target, so, if the media source’s granularity allows us, we must also identify the delivery that is out of range. For example, for a media source that provides the data by country, if the raw data is saying the delivery comes from any country other than Paraguay, we’ll assume the delivery is out of range. For Facebook, if a campaign targeted to Asunción D.C. is delivering elsewhere, it’ll be considered out of range. For Google, any delivery detected outside the target city will be considered out of range.

Objective Costs & Owner
In the best scenario, the squad or team setting up the campaign will create it under an Account with exclusive Objective Cost, like Acquisition, Activation, Retargeting, Retention, Operations, Branding, etc. If this condition is applied, the delivery’s Objective Cost will be detected by the Accounts Map, using the Account ID.

When we can’t rely on the Account ID, we’ll have a naming convention, covering the Objective Cost. The target app will also help us here, for example, if the targeted app is the Operations and Delivery App, we know the Objective Cost is Operations, for example.

This information is key to identify the source of the cost and assign the correct costs to the correct teams and correct KPIs.

It’s also important to identify who is answering for the delivery costs. Most of the campaigns will be assumed by Aranduka, but also some campaigns can be assumed by Allies, like Visa, Master Card, Brands, or Partners.

Currency
Most of the campaigns or accounts will be set up in USD, but others could be paid in Paraguayan Guaranís (PYG), Argentinian Pesos (ARS), or Brazilian Reais (BRL). For that, we’ll first need to be able to detect the delivery currency, and also have a consistent rate. For this exercise, let’s assume the following:

1 USD = 6800 PYG.

1 ARS = 80 PYG.

1 BRL = 5 USD.

The fixed rates will change quarterly, based on the values communicated by the finances department.

Final Online Media Delivery table
After all the conversions, validations, and distributions, the final table, to be consumed by the different Attribution Models and pipelines, will be:

Column Comments
DATE Validated Date.
COUNTRY Validated Country.
REGION Validated Region.
CITY Validated City.
APP Validated App.
ACCOUNT_ID Validated Account ID.
ACCOUNT_NAME Validated Account Name.
CAMPAIGN_ID Validated Campaign ID.
CAMPAIGN_NAME Validated Campaign Name.
ADSET_ID Validated Ad set ID.
ADSET_NAME Validated Ad set Name.
AD_ID Validated Ad ID.
AD_NAME Validated Ad Name.
OBJECTIVE_COST Validated Objective Cost.
OS Validated OS.
RAW_SOURCE Original Source.
SOURCE Validated Source
SQUAD Validated Squad
CURRENCY Billing Currency
ORIGINAL_COST Cost in the original Currency.
COST Converted Cost (USD).
IMPRESSIONS Distributed Impressions.
CLICKS Distributed Clicks.
REACH Distributed Reach.
ASSUMED_BY Assumed by (Aranduka or Ally).
Media Costs Distribution
The distribution process matches the delivery and the attribution data using the touchpoint date. As we’ll be using a 15-day attribution window, the process will recalculate the delivery metrics for the last 15 days every time it runs.

On one side I’ll have the delivery data by date, on the other side, I’ll have all the touchpoints attributed to the events by date.

The Media Costs Distributions will work the same way for the different events (Registers, First Orders, Retention Orders, etc.). The difference will be the Objective Costs data delivery filters used to bring in the delivery data to distribute the costs. For example:

Installs, Registers, First Orders: Acquisition.

Retention Orders:

Branding: Branding.

Growth: Engagement, Reactivation.

Partnerships: Acquisition_Ally

In brief, the delivery distribution tries to perfectly match the events campaigns with the delivery campaigns, then distribute the remaining costs, as follows:

Ad level 1: tries and matches attributes and delivery with exactly the same Ad ID, Ad Set ID, Campaign ID, City, and Date.

Ad Set level 1: with the remaining delivery (costs, clicks, etc.), not distributed in the first step, it tries and matches attributes and delivery with exactly the same Ad Set ID, Campaign ID, City, and Date.

Campaign level 1: with the remaining delivery, not distributed in the previous step, it tries and matches attributes and delivery with exactly the same Campaign ID, City, and Date.

Account level 1: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Account ID, City, and Date.

Ad Level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Ad ID, Ad Set ID, Campaign ID, and Date.

Ad level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Ad Set ID, Campaign ID, and Date.

Ad Set level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Ad Set ID, Campaign ID, and Date.

Campaign level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Campaign ID, and Date.

Account level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Account ID, and Date.

Objective Cost level 1: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Media Source, Objective Cost, City, and Date.

Media Source level 1: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Media Source, City, and Date.

Objective Cost level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Media Source, Objective Cost, and Date.

Media Source level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Media Source and Date.

Squad level 1: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Squad, Objective Cost, City, and Date.

Squad level 2: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Squad, Objective Cost, and Date.

Squad Level 3: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Squad and Date.

City level: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same City, and Date.

Region level: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Region, and Date.

Objective Cost level 3: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Objective Cost, and Date.

Final distribution: with the remaining delivery, not distributed in the previous step, it tries and matches the data with exactly the same Date.

“Data beats emotions”
— Sean Rad
Outputs
Online Media Attribution Tables
Once the events have media source, campaigns, costs, and other delivery KPIs attributed to it, the final tables will look something like this:

First Order
Column Comments
EVENT_DATE Order Date.
EVENT_TIME Order Timestamp.
USER_ID User ID.
USER_QUALITY User Quality (UHVU, HVU, MVU, LVU).
ORDER_ID Order ID.
COUNTRY Order Country.
REGION Order Region.
CITY Order City.
CITY_SCORE Order City Score.
MICROZONE_ID Order Microzone ID.
MICROZONE_SCORE Order Microzone Score.
APP Order App.
APP_VERSION Order App Version.
OS Order OS.
OS_VERSION Order OS Version.
DEVICE_TYPE Order Device Type.
DEVICE Order Device.
DEVICE_SCORE Order Device Score.
VERTICAL Order Vertical.
TOTAL_COST Order Total Cost (USD).
GMV Order GMV (USD).
OPS_COST Order Delivery & Operations Cost (USD).
DISCOUNTS_COST Order Discounts Cost (USD).
CREDITS_COST Order ArandukApp's Credit Cost (USD).
GMV_SCORE Order GMV Score.
PAYMENT_METHOD Order Payment Method.
TOUCH_DATE Attributed Touchpoint Date.
TOUCH_TIME Attribnuted Touchpoint Timestamp.
TOUCH_TYPE Attributed Touchpoint Type.
ACCOUNT_ID Attributed Account ID.
ACCOUNT_NAME Attributed Account Name.
CAMPAIGN_ID Attributed Campaign ID.
CAMPAIGN_NAME Attributed Campaign Name.
ADSET_ID Attributed Ad set ID.
ADSET_NAME Attributed Ad set Name.
AD_ID Attributed Ad ID.
AD_NAME Attributed Ad Name.
OBJECTIVE_COST Attributed Objective Cost.
RAW_SOURCE Attributed Original Source.
SOURCE Attributed Source
SQUAD Attributed Squad
USERS Attributed Users (% of Conversion).
MEDIA_COST Attributed Cost (USD).
IMPRESSIONS Attributed Impressions.
CLICKS Attributed Clicks.
REACH Attributed Reach.
ASSUMED_BY Assumed by (Aranduka or Ally).
Business Dashboards
With the Online Media Attribution Model, Media Delivery Model,  and the Complete User Acquisition Funnel Model tables, available, the BI team can deliver some key dashboards as:

Master Dashboard
Gives the total Burn, New Users, CAC, Orders, CPO, Registers, CPR, Installs, and CPI by Squad / Source. The teams can filter the data by dates, city, microzone, user quality, and other filters.

Campaigns Performance
The teams can review the performance of the campaigns at Objective Cost, Account, Campaign, Ad Set, and Ad levels. They can see the attributed Installs, Registers, Orders, and New Users. They’ll be able to check and adjust their strategies based on reliable data.
