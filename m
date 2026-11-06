Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985727;
	b=Z7D7yv2hjoelUHsoCS6SYOIbHRhAsxOnSo1DZKGz2TkzciyhTaKn42TCzX8t5Yv/3KzZ
	 DElkEss+LwPSrrVokpz5NxJSHG6v2EfGJrEmNMKitAfTLBQ86LZmULxp6XhQXXemnL8oH
	 Yz2DXkM8tw0MAyQ/+dewx4MbrQ4E1RfMv+Dhcl3orD4g/ocf4YITEILEAObvCX0ltleWZ
	 SM8LkQ7bPfxrYp8zm4w1MqYwjQlemPkkZHCellYxxVl+/1Zy/77XtMgWea5rhca4eMV7r
	 JXGHrG8Gcy8L7qJ6sYuCG5BMKhjpRqZV/uE3FalfUNB0XPFjDCq7UFeYnEvXJufPpEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z1d9Rq/osPQvOJOvEkzQXVqv9nV0kIEEShdUH3s8pbQ=;
	b=upu+k/nI3jyLB99+rMtttvJ60ivRdoz3yc03xizMEyY8OtXp/c3Ivv1q/RG4R/SNaNaV
	 4V9X99iosDQ1LxlEipi45pxGayMZ/bwJt7y9z7yqcVkgMYhQ1W9iF/8NnI8hCzplAPV39
	 6XuS3oINRdF3SCWsLcQEqWjQnk//hzV4hFCZEDqKx0xGo6xFuJdTcbFNINrCAhbgCs2vk
	 i3aPKMe6qQeUpKuh0KMc0unZ4qgj3kEzNnsSfYTdnclAxt6TxJ1cR6xTuG4GJXSqf1chB
	 SlZPkCKJnSFKsf3rBVc0WgSJkvo9HirWkpoKUzeY1qcEousfLn/tLGtFZtSxbmlrXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HSHOhKpA;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFA606A335
	for <printk@lists.linux.dev>; Fri,  6 Nov 2026 17:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFFA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HSHOhKpA
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso5805045e9.0
        for <printk@lists.linux.dev>; Fri, 06 Nov 2026 09:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985726; x=1794590526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1d9Rq/osPQvOJOvEkzQXVqv9nV0kIEEShdUH3s8pbQ=;
        b=HSHOhKpAJj9H20ROdKb28xPz3NxYPqYKhz/Wre+Qk2Pc/KFGwgpaBO6HTg14z9v5L6
         Ik9xgjUb2OegcznSJamSiJeHZcEOA7dSzrgiKtmAg7bxXA94BOuY9xnh4lhJExbkFXfX
         l7eRFHZPqNoB5/xjawykEHFVdYdn6+00Q24huocAusWyN9dAsjEKvZeq/s4Dur0e6TEj
         kDp+5diVsthNQbIV41bvm5j3ePZJBse2eU48kIuHAgbHV9Ah12sprmnHiq/PRbLM/NqU
         rsx441FJnTUon1Dr1D1rJjALhi8/rOFV8OQNuWOg8TiUZxQ5d0/xUYAlG+8SjUWy24cE
         L7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985726; x=1794590526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1d9Rq/osPQvOJOvEkzQXVqv9nV0kIEEShdUH3s8pbQ=;
        b=YHsPlbMEDuDKk6uGZKZl5ciOz7gLv7n3+mkYy4iAycwtnEMIokH9fejYMjqyxh+Xhv
         qHvHCMGGPUcLxhwyswbZMHUybHMZy9Lh13+pfn3BsQSOdrE7ZKkx+jmGOFy5a9NGmF+B
         12zeF6s7Dv1mIQviFO3af5NrNlQhwIX/F3hnSOxtWnvOrXOS5bckJJHuZMh3OBg2EgB7
         qp2AFk1BCcK+4eOEkml2a/ifP8f8ngXNd/Vd6w8w33rviGM4f2eTXUMlvNFcWcgFpAjL
         BAfspPv3fovvE9/UCOLFCr1O7Y7ooj6X3VW39fIh1VQVKefeWg3860BKDjaQ3dSECh5W
         aj5w==
X-Forwarded-Encrypted: i=1; AKwUvBwDWXx5+Vdg4GcwdJDsnfHz1jBKFr6cjV+8Fdj5yiCeINMNhyIEs/cNH7EyCm1LQCuLHDq0erQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9DmlIAw8uQl8LPMGNK1b0XlunK3N9R5W1Vb3571B+Mh6MKrlnH
	SBb05oB21WHhGSZywGId8dwHr5UdH4mBdeWaeLXIuc51/AXIHQXEIi0JDUS/JvmCzdc=
X-Gm-Gg: AYBFou26uWAdq+/Pi/aFZIOr0Y+I3qVGRdmhgQLczykyhUmC0Q53fWzB9ichix9dYmZ
	6CxIJC1qoTx07Ycfcv2ATsYRJq/LYVMYLXmBSdEz9n+kh4KcPrIywU9LChKNkXmVX0FwmxaA8Ij
	ljif0ziEDcQbOdzvoSUc87yuJ/SgPP8/xipfKR4r4/76ZKO9s72C5RDjz4xTAkPpv2+cPEGwlPl
	lqAWr79OQnD/ZtC/n1L8wtXIhc681B5K+O3/BnLCSYqV/hQ3eUQvX7ZHJwhZXkS7j5aQXxRuExO
	ixnU+7CetPdK8D++B5hQdJIDoEnwrIrSlwnzhP/OiYy+hifBtgB1njnkNmLnZ/dRZhRPt/DsL6/
	IBpkeahSCOpnDoVS0OSS7Ib3ArTt1wHwoNhm1EA/kNQLQyL55W3IpcURk83lNAJs9MCHd1ONMgf
	mLgmbzGvTzeRjWsUGgQ6G9rwA87JlD/CdLvADip/lnv4aeDCLDYlUihVjWY8wnB28nMsk8OZ9hN
	WYcsTQFzc/aQQ/JjNRJlRBFltlIu8qGGopsjIsI4SXVRd8/uuslrrI1Frjku3VxQx/ADNNj9IpU
	rkPpCmYBolSO4xY2poRVWH1wYZBHjyXS7EAI4aGAEkXii9vxItZc
X-Received: by 2002:a05:600c:530f:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4b6dfbabcf9mr52591765e9.24.1793985725981;
        Fri, 06 Nov 2026 09:22:05 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm6631065e9.1.2026.11.06.09.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:05 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 09/16] printk: Do not quietly ignore adding entry for a preferred console when there is no space
Date: Fri,  6 Nov 2026 18:19:45 +0100
Message-ID: <20261106171952.207909-10-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is hard to imagine that anyone would want to add more than 8 preferred
consoles. But never say never. And do not ignore new entries quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60923b997e4f..1eb542a321a5 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2578,8 +2578,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	struct preferred_console *pc;
 	bool is_new_entry = false;
 
-	if (i >= MAX_PREFERRED_CONSOLES)
+	if (i >= MAX_PREFERRED_CONSOLES) {
+		pr_err_once("Reached maximal number of preferred consoles.\n");
 		return -E2BIG;
+	}
 
 	pc = &preferred_consoles[i];
 
-- 
2.56.0

