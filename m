Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792734331;
	b=T20b6MkqmOy2LVA99MVJDwsLHqm8WfDo7FemGny4qjGUUpYqreAX54IELYuHlUJDSEI7
	 8aeAj6G6MTDMPw00bNjJfJ2xcfAlqwg2EFWu6WZpuAcNGRMw31ID7QRP1RnIr5VWZ0MXT
	 V8+SJrq5kJYKWVRTKZXnEaxhHES99UPvxPwK/d27dKcksSbSVTqgdGqv243QbE2pLwIZj
	 3xmHNXnixKVlSwfc3rqkQ/fGZB4kyVQO7srXNmSBpz4bExfgYca0KbEnrMFEWeCvTD1/V
	 acjH5O40kf+rH00I5PK/eF6w5E7Bv3YqeEdbPsVnE33SlW/Cee6DiJSCFhMbstcDqiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792734331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
	b=2R20+CPf4NY/o5e8MeoCoArfMLxUABpxFeO0SHnd9VMpG7GBeMqBS+D2tRPfVWVvu2R8
	 GOqQNgfssHuXcFhnoVmIcj5Vp4QlhLZJhkAu5bSeLVn6fYHKB7sEgCF1QQc8wlAVIh0+4
	 vVbPEm4JrinekjAVNJbKtboZ4VYapZnT2KarNkO14E+UA9lbDyF5+2KCIb7MLR+H5eP2C
	 lV4UONfdhfWOGM3YhUhX81p6xw8J6YJAEYWitTZjhfKwm5XblaT4k4sPTPmKnAKIjFxw5
	 6lqYeIOHUH+TQfbODeZW6CWGMrgGFx413I7DJGFBMR4FwqOkzj9fMlts6PGoncUBaPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=S2EwWMV8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD092606A320
	for <printk@lists.linux.dev>; Fri, 23 Oct 2026 05:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD092606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=S2EwWMV8
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b28d7c729fso343587b6e.0
        for <printk@lists.linux.dev>; Thu, 22 Oct 2026 22:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792734329; cv=none;
        d=google.com; s=arc-20260327;
        b=m42yQDugmr68/0HlUyygj0DxHZm+8l5WKMGz2+5s/QK2aWIcTNO/hEMKPtLoJwAFMr
         Z4sL2yDImfXIPtEL8+wus2fuAyERqtjmHqqE7MVspWqSVDI2TDsSC19J8wfJqhCoydkH
         EDQaD1FP+fdvw1ffUqwFjD4eSZlf20s/jbIMXn0GuOH9EigU+91Ahk+QuqX7grPnvrOX
         pbT8ijPzErU3jJhP0ID9eDnvCtZ48+rDUGrpVX9i933FrbL+KOG8bbU0tyFE00veNVWX
         JD7pVghp10ecrviYfYpC9e0VSp6op8aZ/P4Oqt7er3UDfOtHhMpgheTwRueDEWXS4SRO
         CrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        fh=69/R39e/U3UIZ2AFYMzm8ytLQJffC/5ulkOpFnxtrM4=;
        b=Wv3MjFLFSNVetfWbdixb3uTwevhyXKszwN7ymdI0LZjd3YygpgdnmrjdAMiWT6Ovp2
         UlVZ6lka9NsxqThkY/P12OxDjtdO8E/wU9249t+nRHivYLTGd9IKB2kYQdIsnctpCvhw
         VNd6P1/c0byTouEl2hUROoXQnx2/Qi9BahK17720Liun48+1hMOJvXWq2g+FkTwuYcyN
         Xpiw2tjZSGBiSSvpZyzpolUaUc1UCwCGelbZzs8zxFyp1/3+8E+qEIpwRZAieFNQ/3El
         RWvB+R0xYGdCMTCCsqAPDP8DBIzxYx5wuQlIEf9Qp5mDZtK03eAROzVwG12CZkOs34G5
         LBvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792734329; x=1793339129; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        b=S2EwWMV8MXrGWhFw5I7MgrqQIvbgZzMACWC1lOd+zbILWPEDq6yCc2iVKkI90xm4NW
         fkYun0n0CetOXZ5oozPJAQNWEbpy3u0zh9LLM6+LfwnLs78utMFBXCZQvM4XY0LPZu+a
         aZB31p/BryM+8iMuyDQKe+mHH7/bcnsmQGDFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792734329; x=1793339129;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        b=VUzDLVg2n2Z5ZcKrJZQnFdEqh+CVs7QHKJGSmGWhhW/i6g2pXV6w6jBSNVFNfGV+0X
         I7vnq2iDYTc3atnXANJbeqhHPG/FlgmF7UAiZrXvUv2QmrrGzLzNq/GSTlHyAYYhEwgH
         AVLlUukWOcG0nKfqp/Y27C7K838y/C1Y+74T1fAxKBbibIoqQyUqQdwnE5IA37VX3tk4
         APTMQv9MqIX0hdgknfhnNEBmi7M8WfD3D2pEDlFBl/JJb3ptXXi03VYpBowK04WrSEk4
         d5HkiysKFZHmEnBMvQhGl5WHJ6xO0sq+Rcs3OW/0t1aRjhSCrzg7czFjQqyWIhmUdxi/
         fX9g==
X-Gm-Message-State: AFq9FYIuxWey6+LLmOkpj4mIQxlcTkyqkrW81t68AQ4LN+UcsXj9GHyT
	EL6kKEbKoQVNLcdnVkxsH2hRlZ9UJj2PJmjJmz6EkwCTclsyMlOEbh/ZhHxLbUcD3ngPT8sHxPa
	l3IRz7gnOOr5ZxCCLNNOyNGI2CkM8SMiw+wAsVBVkjaJlUi8kHGJrE6HIt3Dr
X-Gm-Gg: AYBFou2ozmqOtvdMwbSGYXqyAiCFWsar5JBClQeXgmP6yeCi2rIxh2JEiri5bNy5krD
	vPEBDv730aum31efPGbIy9YYcuQ8Jt9iTP76ZD46e55WTqovROGPAs4MYo3BriHBtryZ5h5qBUT
	h4C+JZl4xMzxi0rT5+OaU7So4/XsUxOGFnsotHPZ96kANvbcZvWZ4eNY6nugs3n4UYh/X8K7iJP
	7XAcLMmOUbjYX0CzF3kcPuFnaJPXrjisXb8QKHw7agT/zCMs3e7n0iesh0KZGjL41444py3f4Pq
	WFffudnDRhipJfMBDSZM3YsxnfGFZvNwei9ie4dFw7TjNTOleYt7Dq+rlZCE8sEdm6pt18sLeC3
	7p8aX0PO3WRqtzjGXHfM5nzEwk390AZNTfhjs6AHEbB1yQkuCSDj5JYnEiCVI51y7AiSuag5hF7
	YQD3dGduWuYL9L
X-Received: by 2002:a05:6808:f0a:b0:503:dc14:8b05 with SMTP id
 5614622812f47-55be82a0b95mr762080b6e.5.1792734328710; Thu, 22 Oct 2026
 22:45:28 -0700 (PDT)
X-Mailing-List: printk@lists.linux.dev
List-Id: <printk.lists.linux.dev>
List-Post: <mailto:printk@lists.linux.dev>
List-Help: <mailto:printk+help@lists.linux.dev>
List-Subscribe: <mailto:printk+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:printk+unsubscribe@lists.linux.dev>
List-Owner: <mailto:printk+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Chris Hoy Poy <choypoy@linuxfoundation.org>
Date: Fri, 23 Oct 2026 13:45:17 +0800
X-Gm-Features: AclHuK8CFTSUr5faTxS6PpXGu0TRdCd7OX1-qTsqHLb3F-Ivs0WnBRraQ0ARBC4
Message-ID: <CAKkv+gwqV3oiLCPveNYEU=RZ1756yURzs9vsAvpUXoRNNANkiw@mail.gmail.com>
Subject: test post - please ignore
To: printk@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a test message to check delivery and start the archive for the
list. Please ignore.

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
