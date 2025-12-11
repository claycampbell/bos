module.exports = async function (context, req) {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        context.res = {
            status: 200,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type'
            },
            body: ''
        };
        return;
    }

    try {
        const feedback = req.body;

        if (!feedback || !feedback.sessionId) {
            context.res = {
                status: 400,
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    'Content-Type': 'application/json'
                },
                body: { success: false, error: 'Missing sessionId' }
            };
            return;
        }

        // Prepare table entity
        const entity = {
            PartitionKey: new Date().toISOString().split('T')[0], // Date as partition key
            RowKey: feedback.sessionId,
            Timestamp: new Date().toISOString(),
            SessionId: feedback.sessionId,
            UserName: feedback.userInfo?.name || '',
            UserEmail: feedback.userInfo?.email || '',
            UserRole: feedback.userInfo?.role || '',
            DiscoveryRatings: JSON.stringify(feedback.discovery?.ratings || {}),
            DiscoveryInsights: (feedback.discovery?.insights || []).join(', '),
            DiscoveryConcerns: feedback.discovery?.concerns || '',
            DiscoveryImprovements: feedback.discovery?.improvements || '',
            VisionRatings: JSON.stringify(feedback.vision?.ratings || {}),
            VisionScenarios: (feedback.vision?.scenarios || []).join(', '),
            VisionConcerns: feedback.vision?.concerns || '',
            VisionImprovements: feedback.vision?.improvements || '',
            SentinelRatings: JSON.stringify(feedback.sentinel?.ratings || {}),
            SentinelMentalModels: (feedback.sentinel?.mentalModels || []).join(', '),
            SentinelConcerns: feedback.sentinel?.concerns || '',
            SentinelImprovements: feedback.sentinel?.improvements || '',
            SubmittedAt: feedback.timestamp || new Date().toISOString(),
            LastSaved: feedback.lastSaved || new Date().toISOString()
        };

        // Save to Azure Table Storage
        context.bindings.outputTable = entity;

        context.log('Feedback saved successfully:', feedback.sessionId);

        context.res = {
            status: 200,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            body: { success: true, sessionId: feedback.sessionId }
        };

    } catch (error) {
        context.log.error('Error saving feedback:', error);

        context.res = {
            status: 500,
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json'
            },
            body: { success: false, error: error.message }
        };
    }
};
